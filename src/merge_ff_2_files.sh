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
for i in {1..3}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
done

###############
# Branchwechsel
git switch -c arbeit

# Auf dm arbeit-Branch 3 Commits ANDERE DATEI
for i in {1..3}
do
  echo "Schritt $i" >> datei_1.txt
  git add datei_1.txt
  git commit -m "Arbeit $i"
done

##############
# Branchwechsel
git switch main

git merge arbeit

