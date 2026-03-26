#!/bin/bash

# Verzeichnis mit den Bildern
IMG_DIR="./"
NEU="git_install"

# Schleife über alle PNG-Dateien, die mit "FreeRDP:" anfangen
for file in "$IMG_DIR"cropped*_*.png; do
    # Prüfen, ob Datei existiert
    [ -e "$file" ] || continue

    # Extrahiere die Nummer nach dem Unterstrich und vor .png
    num=$(echo "$file" | sed -E 's/.*_([0-9]+)\.png/\1/')

    # Zielname
    new_name="${NEU}_${num}.png"

    # Datei umbenennen
    mv "$file" "$IMG_DIR$new_name"
    echo "Renamed '$file' -> '$new_name'"
done
