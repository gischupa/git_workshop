#!/bin/bash

set -e
set -x

echo "Genauerer Blick auf Git"


echo "Repository anlegen"
mkdir versuch_1
cd versuch_1
git init
git branch -m main


echo "Repository erstellt"
echo "Taste drücken"
read

echo "Einfache Einhalte erstellen"
echo "Version 1" > datei1.txt
git add datei1.txt
git commit -m "Erste Datei erstellt"


echo "Version 2" >> datei1.txt
git add datei1.txt
git commit -m "Erläuterung"

git log --oneline

echo "Basisdateien erstellt, Log angezeigt"
echo "Taste drücken"
read


echo "Weitere Zeilen in 2 Dateien"
echo "Version 3" >> datei1.txt
echo "Version 1" >> datei2.txt

git status

echo "Taste drücken"
read

echo "Noch mehr Inhalte in beiden Dateien"
echo "Weitere Zeile" >> datei1.txt
echo "Weitere Zeile" >> datei2.txt

git status

git commit -m "nur Stage"

git status

git add .
git status



