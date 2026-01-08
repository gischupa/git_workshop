#!/bin/bash

# Demo for Cherry without error

rm -rf cherry_labor

mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

echo "Zeile 1" > datei_1.html
git add datei_1.html
git commit -m "z1d1"

echo "Zeile 2" >> datei_1.html
git add datei_1.html
git commit -m "z2d1"

git switch -c development  # branch wechsel

echo "Zeile 1" >> datei_2.html
git add datei_2.html
git commit -m "z1d2"

echo "Zeile 1" >> datei_3.html
git add datei_3.html
git commit -m "z1d3"

echo "Zeile 2" >> datei_2.html
git add datei_2.html
git commit -m "z2d2"

echo "Zeile 3" >> datei_2.html
git add datei_2.html
git commit -m "z3d2"

git switch main  # wieder auf main

echo "Zeile 3" >> datei_1.html
git add datei_1.html
git commit -m "d1z3"

git log --oneline --decorate --graph --all