#!/bin/bash

# Koordinaten und Größe des auszuschneidenden Bereichs
WIDTH=599
HEIGHT=465
X_OFFSET=540
Y_OFFSET=275

# Schleife über alle PNG-Bilder im aktuellen Verzeichnis
for IMAGE in *.png; do
    # Generiere den Namen für das zugeschnittene Bild
    OUTPUT="cropped_${IMAGE}"

    # Schneide das Bild zu
    convert "$IMAGE" -crop ${WIDTH}x${HEIGHT}+${X_OFFSET}+${Y_OFFSET} "$OUTPUT"

    echo "Zugeschnittenes Bild erstellt: $OUTPUT"
done

echo "Alle Bilder wurden erfolgreich zugeschnitten."
