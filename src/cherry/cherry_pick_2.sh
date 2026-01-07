#!/bin/bash

# Demo for Cherry without error

rm -rf cherry_labor

mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

echo "Zeile 1" > index.html
git add index.html
git commit -m "z1"

echo "Zeile 2" >> index.html
git add index.html
git commit -m "z2"

git switch -c development  # branch wechsel

echo "Zeile 3" >> index.html
git add index.html
git commit -m "z3"

echo "Zeile 4" >> index.html
git add index.html
git commit -m "z4"

git switch main  # wieder auf main

echo "Zeile 5" >> index.html
git add index.html
git commit -m "z5"

git log --oneline --decorate --graph --all