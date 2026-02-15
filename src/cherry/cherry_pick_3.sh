#!/bin/bash

# Erstellen einer Struktur zum Probieren 
# von Cherry-pick. Führt i.a. zu einem 
# Konflikt im Sinne dass eine Datei 
# manuell geadded werden muss

# z2 d3 steht für zeile 2 Datei 3

set -e
set -x

cd /tmp
rm -rf cherry_labor

## Lokale Repo erstellen
mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

# Arbeit auf main
echo "Zeile 1" > datei_1.html
git add datei_1.html; git commit -m "z1 d1"

echo "Zeile 2" >> datei_1.html
git add datei_1.html; git commit -m "z2 d1"

############
# Wechsel zu development 
git switch -c development  # branch wechsel

echo "Zeile 1" >> datei_2.html
git add datei_2.html; git commit -m "z1 d2"

echo "Zeile 1" >> datei_3.html
git add datei_3.html; git commit -m "z1 d3"

echo "Zeile 2" >> datei_2.html
git add datei_2.html; git commit -m "z2 d2"

echo "Zeile 3" >> datei_2.html
git add datei_2.html; git commit -m "z3 d2"

###########
# zurück auf main
git switch main  # wieder auf main

echo "Zeile 3" >> datei_1.html
git add datei_1.html; git commit -m "z3 d1"

# Darstellen
git log --oneline --decorate --graph --all

# Ab hier kann im Terminal experimentiert werden

exit 0
