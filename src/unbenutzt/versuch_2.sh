#!/usr/bin/bash

set -x

cd /tmp
rm -rf versuch_2

mkdir versuch_2
cd versuch_2
git init
git branch -m main

echo "Version 2" >> datei1.txt 
git add datei1.txt 
git commit -m "Erläuterung"

echo "Version 2" >> datei1.txt 
git add datei1.txt 
git commit -m "Erläuterung"
