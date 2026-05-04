#!/usr/bin/env bash
# =============================================================
# index.sh — Собрать финальный JSON-индекс + CLIP FAISS эмбеддинги
#
# Для каждого фото объединяет:
#   - .description.json (describe.sh)
#   - .tags.json (tag.sh)
# В единый .meta.json, затем строит CLIP FAISS индекс.
#
# Требует:
#   - clip-retrieval (pip install clip-retrieval)
#
# Использование:
#   ./index.sh <photos_dir> [index_dir]
#
# Примеры:
#   ./index.sh ./photos/
#   ./index.sh ./photos/ ./index/
# =============================================================

set -euo pipefail

PHOTOS_DIR="${1:-./photos}"
INDEX_DIR="${2:-./index}"

if [[ ! -d "$PHOTOS_DIR" ]]; then
  echo "❌ Папка с фото не найдена: $PHOTOS_DIR"
  exit 1
fi

mkdir -p "$INDEX_DIR"

METADATA_FILE="$INDEX_DIR/metadata.jsonl"
> "$METADATA_FILE"  # очищаем

echo "📦 Собираем метаданные..."

count=0
while IFS= read -r -d '' photo; do
  base="${photo%.*}"
  desc_file="${base}.description.json"
  tags_file="${base}.tags.json"

  # Базовая запись
  meta="{\"file\": \"$photo\"}"

  # Мёрджим description
  if [[ -f "$desc_file" ]]; then
    meta=$(python3 -c "
import json, sys
base = json.loads(sys.argv[1])
with open(sys.argv[2]) as f:
    desc = json.load(f)
base.update(desc)
print(json.dumps(base, ensure_ascii=False))
" "$meta" "$desc_file")
  fi

  # Мёрджим tags
  if [[ -f "$tags_file" ]]; then
    meta=$(python3 -c "
import json, sys
base = json.loads(sys.argv[1])
with open(sys.argv[2]) as f:
    tags = json.load(f)
# Мёрджим без дублирования поля file
for k, v in tags.items():
    if k != 'file':
        base[k] = v
print(json.dumps(base, ensure_ascii=False))
" "$meta" "$tags_file")
  fi

  # Добавляем в JSONL
  echo "$meta" >> "$METADATA_FILE"
  ((count++))

done < <(find "$PHOTOS_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) -print0)

echo "   Собрано записей: $count → $METADATA_FILE"

# Красивый summary JSON
python3 -c "
import json
from pathlib import Path

records = []
with open('$METADATA_FILE') as f:
    for line in f:
        line = line.strip()
        if line:
            records.append(json.loads(line))

out = Path('$INDEX_DIR') / 'index_summary.json'
with open(out, 'w', encoding='utf-8') as f:
    json.dump({
        'total': len(records),
        'photos': records
    }, f, ensure_ascii=False, indent=2)
print(f'   Summary: {out}')
"

# Строим CLIP FAISS индекс
echo ""
echo "🔍 Строим CLIP FAISS индекс..."

if ! command -v clip-retrieval &>/dev/null; then
  echo "⚠️  clip-retrieval не найден. Установи: pip install clip-retrieval"
  echo "   Метаданные сохранены, но FAISS индекс не построен."
  exit 0
fi

clip-retrieval index \
  --input_folder "$PHOTOS_DIR" \
  --index_folder "$INDEX_DIR/clip_index" \
  --clip_model "ViT-L/14"

echo ""
echo "✅ Индекс готов:"
echo "   Метаданные: $INDEX_DIR/metadata.jsonl"
echo "   Summary:    $INDEX_DIR/index_summary.json"
echo "   CLIP FAISS: $INDEX_DIR/clip_index/"
