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


git status
git log --oneline


