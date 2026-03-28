cd
rm -rf beispiel_1

git init beispiel_1
cd beispiel_1
git branch -m main

echo "Alles gut" > datei.txt
git add .
git commit -m "alles gut"

# Hier kommt der Fehler
echo "Mist gebaut" >> datei.txt

# Stop von dem Restore
echo "Hier mit strg+c abbrechen"
read

# Alte Version vom Stage wieder herstellen
git restore datei.txt  
