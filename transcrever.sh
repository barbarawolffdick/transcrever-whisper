#!/bin/bash

# ==== CONFIGURAÇÃO ====
OUTPUT_DIR="./transcricoes"
MODEL="base"
LANGUAGE="Portuguese"

# ==== LISTA DE FORMATOS ACEITOS ====
ACCEPTED_FORMATS=("wav" "mp3" "m4a" "aac" "flac" "opus" "ogg" "wma" "aiff" "amr" "webm" "mp4" "mkv" "avi" "mov" "flv")

# ==== CRIA A PASTA SE NÃO EXISTIR ====
mkdir -p "$OUTPUT_DIR"

# ==== VERIFICAÇÃO DE ENTRADA ====
if [ -z "$1" ]; then
  echo "❌ Você precisa informar um arquivo de áudio ou vídeo."
  echo "Exemplo: ./transcrever.sh arquivo.opus"
  exit 1
fi

INPUT_FILE="$1"
BASENAME=$(basename "$INPUT_FILE")
FILENAME="${BASENAME%.*}"
EXT="${INPUT_FILE##*.}"
EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

# ==== CHECA SE O FORMATO É ACEITO ====
IS_ACCEPTED=false
for format in "${ACCEPTED_FORMATS[@]}"; do
  if [[ "$EXT_LOWER" == "$format" ]]; then
    IS_ACCEPTED=true
    break
  fi
done

# ==== PROCESSAMENTO ====
if $IS_ACCEPTED; then
  echo "🎧 Formato $EXT aceito. Usando diretamente no Whisper..."
  AUDIO_FILE="$INPUT_FILE"
else
  echo "🔄 Formato $EXT não aceito diretamente. Convertendo para ${FILENAME}.m4a ..."
  ffmpeg -hide_banner -loglevel error -i "$INPUT_FILE" -c:a aac "${FILENAME}.m4a"
  AUDIO_FILE="${FILENAME}.m4a"
fi

# ==== TRANSCRIÇÃO ====
echo "📝 Transcrevendo $AUDIO_FILE ..."
whisper "$AUDIO_FILE" --language "$LANGUAGE" --model "$MODEL" --output_format txt --output_dir "$OUTPUT_DIR"

echo "✅ Transcrição salva em $OUTPUT_DIR/${FILENAME}.txt"

