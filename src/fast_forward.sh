#!/bin/bash
# Basteln eines FF-Merge

cd /tmp

if [ -d projekt ]; then
  rm -rf projekt
fi

git init projekt
cd projekt

for i in {1..3}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
done

git branch -m main

git switch -c entwicklung

for i in {4..6}
do
  echo "Schritt $i" >> datei.txt
  git add datei.txt
  git commit -m "Schritt $i"
done

echo Zweig erstellt - vor Merge
read

git switch main

git merge entwicklung