cd /tmp
rm -rf lab

git init branch_lab
cd branch_lab 
git branch -m main

echo "Zeile 1" > datei.txt 
git add .
git commit -m "Datei 1 erstellt"

git log --oneline

########################
# Blick in .git

tree .git


echo "Taste drücken"
read

########################

echo "Zeile 2" >> datei.txt 
git add . && git commit -m "Zeile 2"

echo "Zeile 3" >> datei.txt 
git add . && git commit -m "Zeile 3"

git log --oneline  # HEAD->main

########################

git switch -c spielplatz
git log --oneline  # HEAD->spielplatz, main

echo "Inhalt von HEAD"
cat .git/HEAD
# Inhalt Lik-Ebene 1

echo "Taste"
read

echo "Inhhalt von .git/refs/heads/spielplatz und main"
cat .git/refs/heads/spielplatz
cat .git/refs/heads/main

echo "Branchwechsel zu main"
git switch main
git log --oneline  # HEAD->main, arbeit

echo "Inhalt von HEAD"
cat .git/HEAD


echo "Merge von spielplatz auf main"
git merge spielplatz

git log --graph --decorate --oneline --all 


