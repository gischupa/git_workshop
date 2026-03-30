#!/bin/bash

# In beiden Branches wird die gleiche Datei 
# bei jedem Commit um eine Zeile ergänzt.
# "dev" hat 5 commits, main nur 3
#
#  dev             main
#  zeile 1         zeile 1
#  zeile 2         zeile 2
#  zeile 3         zeile 5
#  zeile 4         
#  zeile 5
#
# Pickt man Zeile 3 (commit 3) von dev, so liegt  
# die Zeile in der Datei nicht in der richtigen Zeile!

set -e
set -x

# putzen
cd 
rm -rf cherry_labor

# Repo erstellen
mkdir cherry_labor
cd cherry_labor
git init
git branch -m main

############
# auf main
echo "Zeile 1" > index.html
git add index.html; git commit -m "zeile 1"

echo "Zeile 2" >> index.html
git add index.html; git commit -m "zeile 2"

############
# wechsel zu development
git switch -c development  # branch wechsel

echo "Zeile 3" >> index.html
git add index.html; git commit -m "zeile 3"

echo "Zeile 4" >> index.html
git add index.html; git commit -m "zeile 4"

###########
## Zurück zu main
git switch main  # wieder auf main

echo "Zeile 5" >> index.html
git add index.html; git commit -m "zeile 5"


# Darstellen
git log --oneline --decorate --graph --all
