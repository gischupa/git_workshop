#!/bin/bash

set -e
set -x


# Nützliche Variablen
ARBEIT=/tmp        # Dort arbeiten wir 
SUSI=$ARBEIT/susi  # Abkürzungen für den Überblick  
MAX=$ARBEIT/max

IP=192.168.3.154 # Mein Server

# Repository auf dem Server erstellen
ssh benutzer@$IP '
cd /home/benutzer
rm -rf entfernt.git

git init --bare entfernt.git
cd entfernt.git
git branch -m main
'


cd $ARBEIT
rm -rf vorbereitung
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

cd $ARBEIT
rm -rf susi max   # alte Daten löschen
git clone benutzer@$IP:/home/benutzer/entfernt.git susi 
git clone benutzer@$IP:/home/benutzer/entfernt.git max   

exit 0

