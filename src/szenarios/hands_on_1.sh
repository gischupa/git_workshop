#!/bin/bash

mkdir hands_on_1
cd hands_on_1

git init
git branch -m main

echo "Version 1" >> datei1.txt

git add datei1.txt
git commit -m "Erste Datei erstellt"

echo "Version 2" >> datei1.txt 
git add datei1.txt 
git commit -m "Erläuterung"

git status

