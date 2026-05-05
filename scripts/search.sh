#!/usr/bin/env bash
# =============================================================
# search.sh — Поиск фото по текстовому запросу
#
# Поиск работает в двух режимах:
#   1. Тегный (--tags): запрос → нормализация через реестр → фильтр по canonical тегам
#   2. Семантический (--semantic): запрос → CLIP эмбеддинг → FAISS nearest neighbors
#   3. Комбинированный (по умолчанию): оба режима + ранжирование
#
# Использование:
#   ./search.sh "вода продукт" [options]
#
# Опции:
#   --index    <path>    Папка с индексом (default: ./index)
#   --top      <N>       Количество результатов (default: 10)
#   --mode     tags|semantic|combined   (default: combined)
#   --registry <path>    Путь к реестру тегов (default: ../tag-registry.yaml)
#
# Примеры:
#   ./search.sh "брызги воды"
#   ./search.sh "product minimal cold tone" --top 5
#   ./search.sh "вода" --mode tags
# =============================================================

set -euo pipefail

QUERY="${1:-}"
INDEX_DIR="./index"
TOP_N=10
MODE="combined"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGISTRY="$SCRIPT_DIR/../tag-registry.yaml"

if [[ -z "$QUERY" ]]; then
  echo "❌ Укажи поисковый запрос"
  echo "   Использование: $0 \"запрос\" [--top N] [--mode tags|semantic|combined]"
  exit 1
fi

# Парсим аргументы
shift
while [[ $# -gt 0 ]]; do
  case "$1" in
    --index)    INDEX_DIR="$2"; shift 2 ;;
    --top)      TOP_N="$2"; shift 2 ;;
    --mode)     MODE="$2"; shift 2 ;;
    --registry) REGISTRY="$2"; shift 2 ;;
    *) echo "⚠️  Неизвестный аргумент: $1"; shift ;;
  esac
done

METADATA_FILE="$INDEX_DIR/metadata.jsonl"

if [[ ! -f "$METADATA_FILE" ]]; then
  echo "❌ Индекс не найден: $METADATA_FILE"
  echo "   Сначала запусти: ./index.sh <photos_dir>"
  exit 1
fi

# Python-скрипт поиска
python3 << PYEOF
import json
import sys
import yaml
from pathlib import Path

query = """$QUERY"""
index_dir = Path("$INDEX_DIR")
registry_path = "$REGISTRY"
top_n = $TOP_N
mode = "$MODE"

# ── Загружаем реестр ─────────────────────────────────────────
with open(registry_path, "r", encoding="utf-8") as f:
    registry = yaml.safe_load(f)

alias_to_canonical = {}
canonical_to_aliases = {}
for key, entry in registry.items():
    canonical = entry.get("canonical", key)
    all_terms = [canonical] + entry.get("aliases", [])
    canonical_to_aliases[canonical] = all_terms
    for term in all_terms:
        alias_to_canonical[term.lower()] = canonical

def expand_query(q: str) -> list[str]:
    """Разворачиваем запрос в список canonical тегов."""
    words = [w.strip() for w in q.replace(",", " ").split() if w.strip()]
    canonicals = set()
    for word in words:
        # Прямое совпадение
        if word.lower() in alias_to_canonical:
            canonicals.add(alias_to_canonical[word.lower()])
        # Частичное совпадение
        for alias, canonical in alias_to_canonical.items():
            if word.lower() in alias or alias in word.lower():
                canonicals.add(canonical)
    return list(canonicals)

# Загружаем метаданные
records = []
with open(index_dir / "metadata.jsonl") as f:
    for line in f:
        line = line.strip()
        if line:
            records.append(json.loads(line))

query_canonicals = expand_query(query)

print(f"🔍 Запрос: \"{query}\"")
print(f"📌 Normalized → canonical tags: {query_canonicals}")
print(f"📊 Режим: {mode} | Топ: {top_n}")
print()

results = []

if mode in ("tags", "combined"):
    # Тегный поиск — считаем совпадения canonical тегов
    for rec in records:
        rec_tags = set(rec.get("tags_canonical", []))
        matches = rec_tags & set(query_canonicals)
        score = len(matches)
        if score > 0:
            results.append({
                "file": rec.get("file", ""),
                "score": score,
                "matched_tags": list(matches),
                "all_tags": list(rec_tags),
                "description": rec.get("description", ""),
                "mode": "tags"
            })

if mode in ("semantic", "combined"):
    # Семантический поиск через CLIP
    clip_index = index_dir / "clip_index"
    if clip_index.exists():
        try:
            from clip_retrieval.clip_client import ClipClient, Modality
            client = ClipClient(
                url="local",
                indice_folder=str(clip_index),
                num_images=top_n
            )
            semantic_results = client.query(text=query)
            for i, r in enumerate(semantic_results):
                results.append({
                    "file": r.get("url", r.get("id", "")),
                    "score": top_n - i,
                    "matched_tags": [],
                    "description": "",
                    "mode": "semantic"
                })
        except Exception as e:
            print(f"  [warn] Семантический поиск: {e}", file=sys.stderr)

# Дедупликация и сортировка
seen = {}
for r in results:
    f = r["file"]
    if f not in seen or r["score"] > seen[f]["score"]:
        seen[f] = r

final = sorted(seen.values(), key=lambda x: -x["score"])[:top_n]

if not final:
    print("😔 Ничего не найдено. Попробуй другие слова.")
    sys.exit(0)

print(f"✅ Найдено: {len(final)} результатов\n")
print("─" * 60)

for i, r in enumerate(final, 1):
    print(f"{i}. {r['file']}")
    if r.get("matched_tags"):
        print(f"   🏷  Теги: {', '.join(r['matched_tags'])}")
    if r.get("description"):
        desc = r["description"][:120] + "..." if len(r["description"]) > 120 else r["description"]
        print(f"   📝 {desc}")
    print(f"   ⭐ Score: {r['score']} [{r['mode']}]")
    print()
PYEOF
