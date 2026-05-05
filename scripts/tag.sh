#!/usr/bin/env bash
# =============================================================
# tag.sh — Извлечь технические теги + объекты, нормализовать через реестр
#
# Для каждого фото создаёт .tags.json с полями:
#   - tags_canonical: список нормализованных тегов
#   - tags_technical: structured checkboxes (lighting, composition, etc.)
#   - objects: {main_subject, foreground, background, props}
#
# Требует:
#   - clip-interrogator (pip install clip-interrogator)
#   - ultralytics (pip install ultralytics)
#   - PyYAML (pip install pyyaml)
#   - tag-registry.yaml в корне проекта
#
# Использование:
#   ./tag.sh <photo_or_dir> [registry_path]
#
# Примеры:
#   ./tag.sh photo_001.jpg
#   ./tag.sh ./photos/ ../tag-registry.yaml
# =============================================================

set -euo pipefail

INPUT="${1:-}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REGISTRY="${2:-$SCRIPT_DIR/../tag-registry.yaml}"

if [[ -z "$INPUT" ]]; then
  echo "❌ Укажи файл или папку"
  echo "   Использование: $0 <photo.jpg | ./photos/> [registry.yaml]"
  exit 1
fi

if [[ ! -f "$REGISTRY" ]]; then
  echo "❌ Реестр тегов не найден: $REGISTRY"
  exit 1
fi

# Python-скрипт для тегирования одного фото
TAGGER_PY="$(mktemp /tmp/tagger_XXXXXX.py)"
trap 'rm -f "$TAGGER_PY"' EXIT

cat > "$TAGGER_PY" << 'PYEOF'
import sys
import json
import yaml
from pathlib import Path

photo_path = sys.argv[1]
registry_path = sys.argv[2]
output_path = sys.argv[3]

# ── Загружаем реестр ─────────────────────────────────────────
with open(registry_path, "r", encoding="utf-8") as f:
    registry = yaml.safe_load(f)

# Строим обратный индекс: alias_lower → canonical
alias_to_canonical = {}
for key, entry in registry.items():
    canonical = entry.get("canonical", key)
    alias_to_canonical[canonical.lower()] = canonical
    for alias in entry.get("aliases", []):
        alias_to_canonical[alias.lower()] = canonical

def normalize(word: str) -> str | None:
    """Привести слово/фразу к canonical тегу или вернуть None."""
    w = word.strip().lower()
    if w in alias_to_canonical:
        return alias_to_canonical[w]
    # Частичное вхождение — ищем по словам
    for alias, canonical in alias_to_canonical.items():
        if alias in w or w in alias:
            return canonical
    return None

def normalize_list(words: list[str]) -> list[str]:
    result = []
    seen = set()
    for w in words:
        c = normalize(w)
        if c and c not in seen:
            result.append(c)
            seen.add(c)
    return result

# ── clip-interrogator — технические теги ─────────────────────
try:
    from clip_interrogator import Config, Interrogator
    from PIL import Image

    img = Image.open(photo_path).convert("RGB")
    ci = Interrogator(Config(clip_model_name="ViT-L-14/openai"))
    clip_prompt = ci.interrogate_fast(img)
    clip_tags = [t.strip() for t in clip_prompt.split(",")]
except Exception as e:
    print(f"  [warn] clip-interrogator: {e}", file=sys.stderr)
    clip_tags = []

# ── YOLO — детекция объектов ──────────────────────────────────
try:
    from ultralytics import YOLO
    model = YOLO("yolov8n.pt")
    results = model(photo_path, verbose=False)
    yolo_objects = []
    for r in results:
        for cls_id in r.boxes.cls.tolist():
            name = model.names[int(cls_id)]
            yolo_objects.append(name)
except Exception as e:
    print(f"  [warn] YOLO: {e}", file=sys.stderr)
    yolo_objects = []

# ── Нормализация всех тегов через реестр ─────────────────────
all_raw = clip_tags + yolo_objects
canonical_tags = normalize_list(all_raw)

# ── Классификация по категориям ───────────────────────────────
category_map = {}
for key, entry in registry.items():
    canonical = entry.get("canonical", key)
    cat = entry.get("category", "other")
    category_map[canonical] = cat

# Технические теги по группам
TECH_CATEGORIES = {"lighting", "composition", "format", "style", "mood", "color"}
tech_tags = {cat: [] for cat in TECH_CATEGORIES}
for tag in canonical_tags:
    cat = category_map.get(tag)
    if cat in TECH_CATEGORIES:
        tech_tags[cat].append(tag)

# Объекты
object_tags = [t for t in canonical_tags if category_map.get(t) in {"object", "element", "material"}]
background_tags = [t for t in canonical_tags if category_map.get(t) == "background"]

# Упрощённое разделение объектов (без depth estimation)
objects = {
    "main_subject": object_tags[:2] if object_tags else [],
    "foreground": object_tags[2:4] if len(object_tags) > 2 else [],
    "background": background_tags,
    "props": object_tags[4:] if len(object_tags) > 4 else []
}

# ── Результат ─────────────────────────────────────────────────
result = {
    "file": photo_path,
    "tags_canonical": canonical_tags,
    "tags_technical": {k: v for k, v in tech_tags.items() if v},
    "objects": {k: v for k, v in objects.items() if v},
    "raw_clip_tags": clip_tags,
    "raw_yolo_objects": yolo_objects
}

with open(output_path, "w", encoding="utf-8") as f:
    json.dump(result, f, ensure_ascii=False, indent=2)

print(f"  canonical tags: {canonical_tags}")
PYEOF

tag_one() {
  local photo="$1"
  local base="${photo%.*}"
  local out="${base}.tags.json"

  if [[ -f "$out" ]]; then
    echo "⏭  Пропускаем (уже есть): $photo"
    return
  fi

  echo "🏷  Тегируем: $photo"
  python3 "$TAGGER_PY" "$photo" "$REGISTRY" "$out"
  echo "   ✅ Сохранено: $out"
}

# Обрабатываем файл или папку
if [[ -f "$INPUT" ]]; then
  tag_one "$INPUT"
elif [[ -d "$INPUT" ]]; then
  count=0
  while IFS= read -r -d '' photo; do
    tag_one "$photo"
    ((count++))
  done < <(find "$INPUT" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) -print0)
  echo ""
  echo "✅ Обработано фото: $count"
else
  echo "❌ Файл или папка не найдены: $INPUT"
  exit 1
fi
