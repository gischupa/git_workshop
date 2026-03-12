#!/bin/bash
cd /tmp
rm -rf rebase_lab
git init rebase_lab
cd rebase_lab
git branch -m main

echo "start" >> datei.txt
git add . && git commit -m "Start"

# Branch-Wechsel
git switch -c arbeit

for i in {1..10};do
  echo "inhalt $i" >> datei.txt
  git add . && git commit -m "Inhalt $i"
done

# Branch-Wechsel
git switch main 

echo "Zwischenstopp" >> datei.txt     # <<<< HIER Konflikt
git add . && git commit -m "Zwischenstopp"


