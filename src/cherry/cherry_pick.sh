#!/bin/bash

# Demo for Cherry without error

rm -rf cherry_labor

mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

echo "<h1>Intro</h1>" > index.html
git add index.html
git commit -m "initial"

echo "<h2>Einleitung</h2>" >> index.html
git add index.html
git commit -m "Einleitung"

git switch -c development

echo "<div class='nav'> ... </div> " > nav.html
git add nav.html
git commit -m "Nav Start"

echo "<script>...</script> " >> nav.html
git add nav.html
git commit -m "javascript begonnen"

git switch main

echo "<h2>Hauptteil</h2>" >> index.html
git add index.html
git commit -m "Hauptteil"

git log --oneline --decorate --graph --all