#!/bin/bash

# Zwei Branches, unterschiedliche Dateien

# Putzen
cd /tmp
rm -rf cherry_labor

# Lokales Repo erstellen
mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

#############
# Auf branch main
echo "<h1>Intro</h1>" > index.html
git add index.html
git commit -m "initial"

echo "<h2>Einleitung</h2>" >> index.html
git add index.html
git commit -m "Einleitung"

#############
# wechsel zu development
git switch -c development

echo "<div class='nav'> ... </div> " > nav.html
git add nav.html
git commit -m "Nav Start"

echo "<script>...</script> " >> nav.html
git add nav.html
git commit -m "javascript begonnen"

#############
# zurück zu main
git switch main

echo "<h2>Hauptteil</h2>" >> index.html
git add index.html
git commit -m "Hauptteil"

git log --oneline --decorate --graph --all
