#!/bin/bash
# Basteln eines 3-Wege-Merge

cd /tmp

if [ -d projekt ]; then
  rm -rf projekt
fi

git init projekt
cd projekt
git branch -m main

# Auf dm Main Branch
for i in {1..3}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
done

####################
# Branch-Wechsel
git switch -c entwicklung

for i in {4..6}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Entwicklung $i"
done

###############
# Branch-Wechsel
git switch main

# Weiterentwicklung von main
echo "Schritt 7" >> datei.txt # <<<<<<< gleiche Datei
git add datei.txt
git commit -m "Schritt 7"

###########
# Merge

git merge entwicklung