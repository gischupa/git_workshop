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

# Auf dem main-Branch 10 Commits
for i in {1..10}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
  git tag step_$i
done

####################
# Alles nach Schritt 3 löschen

git reset --hard step_3


####################
# Kontrolle

cat datei.txt
git status
git log --oneline

exit 0
