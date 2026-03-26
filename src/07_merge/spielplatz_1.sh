#!/bin/bash

set -e
set -x

cd /tmp
rm -rf spielplatz

git init spielplatz
cd spielplatz
git branch -m main


for i in $(seq 1 3)
do
  echo "Zeile $i" >> datei_main.txt
  git add .
  git commit -m "commit $i"
done

git switch -c spielplatz

for i in $(seq 1 3)
do
  echo "Game $i" >> datei_spiel.txt
  git add .
  git commit -m "Game $i"
done

git switch main

for i in $(seq 4 5)
do
  echo "Zeile $i" >> datei_main.txt
  git add .
  git commit -m "Commit $i"
done
