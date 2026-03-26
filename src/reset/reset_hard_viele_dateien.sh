#!/bin/bash

# Soll das Verhalten von reset --hard demonstrieren
# Bei "hard" entsteht genau der Zusatnd des Commits

set -e
set -x

cd /tmp

# Putzen
  rm -rf projekt

# Neues Repo - lokalwork
git init projekt
cd projekt
git branch -m main

# Auf dm main-Branch 10 Commits mit 10 Dateien
for i in {1..10}
do
  echo "Schritt $i" >> datei_$i.txt
  git add datei_$i.txt
  git commit -m "Schritt $i"
  git tag step_$i
done

####################
# Alles nach Schritt 3 löschen

git reset --hard step_3


####################
# Kontrolle

ls
git status
git log --oneline


exit 0
