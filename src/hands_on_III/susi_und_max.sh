#!/bin/bash

set -x

IP=192.168.3.154
# Putzen früherer Versuche
ssh benutzer@$IP '
cd /home/benutzer
rm -rf entfernt.git

git init --bare entfernt.git
cd entfernt.git
git branch -m main
'

# Nützliche Variablen
ARBEIT=/tmp  # aktuellen Pfad merken 
SUSI=$ARBEIT/susi  # Abkürzungen für den Überblick  
MAX=$ARBEIT/max

####### Vorbereitung
# Hier wird eine Datei ins Server-repo aufgenommen
# indem vorübergehend ein weiteres Repo erstellt wird.
git clone benutzer@${IP}:/home/benutzer/entfernt.git vorbereitung
cd vorbereitung
git branch -m main
echo "Welcome" > README.md
git add README.md
git commit -m "Init"
git push -u origin main
cd ..
rm -rf vorbereitung
###### Ende Vorbereitung - löschen der lokalen Altlasten#######

cd /tmp
rm -rf susi max
git clone benutzer@$IP:/home/benutzer/entfernt.git susi 
git clone benutzer@$IP:/home/benutzer/entfernt.git max   

exit 0

