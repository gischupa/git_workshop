#!/bin/bash

# Repository löschen falls vorhanden
cd 
rm -rf demo_mix
git init demo_mix
cd demo_mix
git branch -m main

for i in {1..10}; do
  echo "Zeile $i" >> datei.txt
  git add . && git commit -m "Zeile $i eingefügt"
  git tag commit_$i
done

cat datei.txt # liefert 10 Zeilen

git reset --mixed commit_4

cat datei.txt # liefert immer noch 10 Zeilen

git log --oneline # liefert 4 Zeilen

git status # zeigt eine geänderte, versionierte Datei
