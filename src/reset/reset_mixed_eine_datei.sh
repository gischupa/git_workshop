#!/bin/bash

# bei einem --mixed reset wird auf den Commit zurückgesetzt, 
# inklusive Stage! 
# Das workdir behält aber den aktuellen Stand


set -e
set -x

cd /tmp

# Putzen
rm -rf projekt

# Neues Repo - lokalwork
git init projekt
cd projekt
git branch -m main

# Auf dm main-Branch 10 Commits
for i in {1..10}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
  git tag step_$i
done

####################
# Alles nach Schritt 3 löschen

git reset --mixed step_3


####################
# Kontrolle

cat datei.txt
git status
git log --oneline

exit 0
