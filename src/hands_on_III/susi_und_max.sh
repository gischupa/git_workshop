#!/bin/bash

# Putzen früherer Versuche
  rm -rf labor2

# Anlegen des Labor-Ordners
mkdir labor2
cd labor2

# "Server" Repository erstellen
git init --bare entfernt.git
cd entfernt.git
git branch -m main
cd ..

# Nützliche Variablen
ARBEIT=$PWD  # aktuellen Pfad merken 
SUSI=$ARBEIT/susi  # Abkürzungen für den Überblick  
MAX=$ARBEIT/max

####### Vorbereitung
# Hier wird eine Datei ins Server-repo aufgenommen
# indem vorübergehend ein weiteres Repo erstellt wird.
git clone $ARBEIT/entfernt vorbereitung
cd vorbereitung
echo "Hi" > README.md
git add README.md
git commit -m "Init"
git push -u origin main
cd ..
rm -rf vorbereitung
###### Ende Vorbereitung #######

git clone $ARBEIT/entfernt susi 
git clone $ARBEIT/entfernt max   

