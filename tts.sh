#!/bin/bash
TEXT=""
while true; do
    TEXT=$(zenity --entry \
        --title="TTS program." \
	--text=""\
	--entry-text="$TEXT")
    if [ $? -ne 0 ]; then
        break
    fi
    if [ -z "$TEXT" ]; then
        continue
    fi
    espeak-ng -b1 -a200 -v en "$TEXT" --stdout | paplay --device=VirtualSpeaker
done
