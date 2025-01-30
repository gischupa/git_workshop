#!/bin/bash
# Basteln eines 3-Wege-Merge

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

git switch main

echo "Schritt 7" >> datei_a.txt
git add datei_a.txt
git commit -m "Schritt 7"


#echo Zweig erstellt - vor Merge
#read

git switch main

for i in {11..13}
do 
 echo "$i" >> datei_a.txt
 git add datei_a.txt
 git commit -m "$i"
done

exit 0 
#git merge entwicklung