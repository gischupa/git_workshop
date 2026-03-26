#!/bin/bash

set -x

# Anlegen des konfliktn-Repos

akt=$PWD

cd /tmp

if [ -d konflikt ]; then
  rm -rf konflikt
fi

git init konflikt

mkdir konflikt
cd konflikt


echo "Zeile 1 inhalt 1" > datei.txt
git add .
git commit -m "original"

git switch -c alternativ
sed -i -e "s/Zeile/Feile/g" datei.txt
git add .
git commit -m "Feile"


git switch master
sed -i -e "s/Zeile/Eile/g" datei.txt
git add .
git commit -m "Eile"

git merge alternativ
