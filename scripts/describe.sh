#!/usr/bin/env bash
# =============================================================
# describe.sh — Сгенерировать человеческое описание фото через LLaVA (ollama)
#
# Для каждого фото создаёт .description.json с полями:
#   - description: развёрнутое описание на русском
#   - objects_raw: список объектов, которые виден на фото
#   - mood_raw: ощущение / настроение
#
# Использование:
#   ./describe.sh <photo_or_dir>
#
# Примеры:
#   ./describe.sh photo_001.jpg
#   ./describe.sh ./photos/
# =============================================================

set -euo pipefail

INPUT="${1:-}"

if [[ -z "$INPUT" ]]; then
  echo "❌ Укажи файл или папку"
  echo "   Использование: $0 <photo.jpg | ./photos/>"
  exit 1
fi

# Проверяем что ollama запущен
if ! command -v ollama &>/dev/null; then
  echo "❌ ollama не найден. Установи: https://ollama.com"
  exit 1
fi

# Проверяем что llava доступна
if ! ollama list 2>/dev/null | grep -q "llava"; then
  echo "⚠️  Модель llava не найдена. Загружаем..."
  ollama pull llava
fi

PROMPT_DESCRIPTION='Опиши это фото подробно на русском языке так, как если бы ты объяснял коллеге что на нём изображено. Включи: главный объект, что происходит на фото, фон и окружение, освещение, настроение и ощущение, стиль съёмки. Ответь одним абзацем без заголовков.'

PROMPT_OBJECTS='Перечисли ВСЕ объекты которые ты видишь на фото — главные, на фоне, пропсы, поверхности, материалы. Ответь только через запятую, без пояснений.'

PROMPT_MOOD='Какое настроение и ощущение создаёт это фото? Ответь 2-4 словами через запятую.'

describe_one() {
  local photo="$1"
  local base="${photo%.*}"
  local out="${base}.description.json"

  if [[ -f "$out" ]]; then
    echo "⏭  Пропускаем (уже есть): $photo"
    return
  fi

  echo "🔍 Описываем: $photo"

  local description
  description=$(ollama run llava "$PROMPT_DESCRIPTION" --images "$photo" 2>/dev/null | tr '\n' ' ' | xargs)

  local objects_raw
  objects_raw=$(ollama run llava "$PROMPT_OBJECTS" --images "$photo" 2>/dev/null | tr '\n' ' ' | xargs)

  local mood_raw
  mood_raw=$(ollama run llava "$PROMPT_MOOD" --images "$photo" 2>/dev/null | tr '\n' ' ' | xargs)

  # Сохраняем JSON
  python3 -c "
import json, sys
data = {
    'file': sys.argv[1],
    'description': sys.argv[2],
    'objects_raw': [o.strip() for o in sys.argv[3].split(',') if o.strip()],
    'mood_raw': [m.strip() for m in sys.argv[4].split(',') if m.strip()]
}
print(json.dumps(data, ensure_ascii=False, indent=2))
" "$photo" "$description" "$objects_raw" "$mood_raw" > "$out"

  echo "   ✅ Сохранено: $out"
}

# Обрабатываем файл или папку
if [[ -f "$INPUT" ]]; then
  describe_one "$INPUT"
elif [[ -d "$INPUT" ]]; then
  count=0
  while IFS= read -r -d '' photo; do
    describe_one "$photo"
    ((count++))
  done < <(find "$INPUT" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) -print0)
  echo ""
  echo "✅ Обработано фото: $count"
else
  echo "❌ Файл или папка не найдены: $INPUT"
  exit 1
fi
