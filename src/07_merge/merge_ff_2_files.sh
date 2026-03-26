#!/bin/bash

# Hier wird Branch 1 nicht verändert, während
# in Branch 2 eine andere Datei bearbeitet wird.
# ff ist damit möglich

set -e
set -x

cd /tmp

# Putzen
rm -rf projekt

# Neues Repository - lokalwork
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

# Auf dem arbeit-Branch 3 Commits ANDERE DATEI
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

exit 0
