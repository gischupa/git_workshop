#!/bin/bash
cd /tmp

# Putzen
if [ -d projekt ]; then
  rm -rf projekt
fi

# Neues Repo
git init projekt
cd projekt
git branch -m main

# Auf dm main-Branch 3 Commits
for i in {1..10}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
  git tag step_$i
done

####################
# Alles nach Schritt 3 löschen

git reset --soft step_3


####################
# Kontrolle

cat datei.txt
git status
git log --oneline


