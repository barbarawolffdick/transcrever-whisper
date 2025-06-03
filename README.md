# transcrever-whisper

Script em shell para automatizar a transcrição de áudios e vídeos usando o modelo open-source Whisper da OpenAI.

---

## O que este script faz

- Aceita arquivos de áudio e vídeo (`.mp3`, `.wav`, `.opus`, `.mp4`, etc.)
- Verifica se o formato é compatível com o Whisper
- Converte automaticamente formatos não suportados para `.m4a` via FFmpeg
- Permite definir o idioma da transcrição: `Portuguese`, `Spanish` ou `English`
- Executa o Whisper e salva a transcrição em `.txt` na pasta `transcricoes/`

---

## Como usar

### 1. Dar permissão de execução ao script (apenas uma vez)

```bash
chmod +x transcrever.sh
```

### ### 2. Executar o script

```bash
./transcrever.sh arquivo.extensao [idioma]
```

Se nenhum idioma for informado, o padrão é Portuguese

Exemplos

```bash

./transcrever.sh entrevista.opus
./transcrever.sh gravação.mp4 English
./transcrever.sh aula.ogg Spanish
```

A transcrição será salva como:

```bash
./transcricoes/entrevista.txt
```

### Requisitos
Whisper instalado via pipx:

```bash
pipx install git+https://github.com/openai/whisper.git
```

FFmpeg instalado:

```bash
brew install ffmpeg
```


📄 Licença – GNU General Public License v3.0 (GPL-3.0)
Copyright (C) 2024 Barbara Wolff Dick

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

Eu que fiz! (por @barbarawolffdick)







