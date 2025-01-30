#!/bin/bash

cd /tmp

if [ -d projekt ]; then
  rm -rf projekt
  fi


git init projekt
cd projekt

echo "-------------------"

echo "Version 1" > datei1.txt 
git add datei1.txt 
git commit -m "Erste Datei"

echo "Version 2" >> datei1.txt 
git add datei1.txt 
git commit -m "Erläuterung"
echo "-------------------"
git status

echo "---------------- Details -------"
echo "--------------------------------"

echo "----WD füllen------------"
echo "Version 3" >> datei1.txt
echo "Version 1" >> datei2.txt

git status

echo "------------- in Stage "
git add . --all 
git status

echo "---------Inhalt in WD und Stage"
echo "Weitere Zeile" >> datei1.txt  
echo "Weitere Zeile" >> datei2.txt 
git status 
