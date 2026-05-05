#!/usr/bin/env bash
# =============================================================
# download.sh — Скачать фото из URL (Behance / 500px / Flickr / прямые ссылки)
# Использует gallery-dl
#
# Использование:
#   ./download.sh <URL> [output_dir]
#
# Примеры:
#   ./download.sh "https://www.behance.net/gallery/12345/Project-Name"
#   ./download.sh "https://500px.com/p/username" ./photos
#   ./download.sh "https://www.flickr.com/photos/username/sets/123456"
# =============================================================

set -euo pipefail

URL="${1:-}"
OUTPUT_DIR="${2:-./photos}"

if [[ -z "$URL" ]]; then
  echo "❌ Укажи URL для скачивания"
  echo "   Использование: $0 <URL> [output_dir]"
  exit 1
fi

# Проверяем что gallery-dl установлен
if ! command -v gallery-dl &>/dev/null; then
  echo "❌ gallery-dl не найден. Установи: pip install gallery-dl"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

echo "📥 Скачиваем: $URL"
echo "📁 Папка: $OUTPUT_DIR"

gallery-dl \
  --directory "$OUTPUT_DIR" \
  --filename "{filename}.{extension}" \
  --write-metadata \
  --write-info-json \
  --no-skip \
  "$URL"

echo ""
echo "✅ Готово. Фото сохранены в: $OUTPUT_DIR"
echo "   Количество файлов: $(find "$OUTPUT_DIR" -type f -name "*.jpg" -o -name "*.png" -o -name "*.webp" | wc -l)"
