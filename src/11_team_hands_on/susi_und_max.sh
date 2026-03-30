#!/bin/bash

set -e
set -x

base="/tmp"
#bash=~
cd $base

rm -rf team_handson
mkdir team_handson
cd team_handson

# Nützliche Variablen
ARBEIT=$base/team_handson   # Dort arbeiten wir 
SUSI=$ARBEIT/susi       # Abkürzungen für den Überblick  
MAX=$ARBEIT/max


# Repository wird auf dem "Pseudo-Server" erstellt

cd $ARBEIT
rm -rf entfernt.git  # putzen
git init --bare entfernt.git
cd entfernt.git
git branch -m main

cd $ARBEIT
rm -rf vorbereitung  #putzen

# Max und Susi clonen sich das Repository
cd $ARBEIT
rm -rf susi max   # putzen = alte Versuche löschen
git clone $ARBEIT/entfernt.git susi 
git clone $ARBEIT/entfernt.git max   

exit 0

