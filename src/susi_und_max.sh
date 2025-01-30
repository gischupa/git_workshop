#!/bin/bash

# Putzen
if [ -d labor2 ]
then 
  rm -rf labor2
fi 

# Anlegen
mkdir labor2
cd labor2

git init --bare entfernt.git
cd entfernt.git
git branch -m main
cd ..

ARBEIT=$PWD  # aktuellen Pfad merken 
SUSI=$ARBEIT/susi  # Abkürzungen für den Überblick  
MAX=$ARBEIT/max

# Overhead
git clone $ARBEIT/entfernt vorbereitung
cd vorbereitung
echo "Hi" > README.md
git add README.md
git commit -m "Init"
git push -u origin main
cd ..
rm -rf vorbereitung

git clone $ARBEIT/entfernt susi 
git clone $ARBEIT/entfernt max   

#
#cd $SUSI 
#echo "Hallo" > datei.txt 
#git add datei.txt 
#git commit -m "Hallo geschrieben"

#git branch -m main 