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

echo "Zeile 2" >> datei.txt 
git add . && git commit -m "Zeile 2"

echo "Zeile 3" >> datei.txt 
git add . && git commit -m "Zeile 3"

git log --oneline  # HEAD->main

########################

git switch -c arbeit
git log --oneline  # HEAD->arbeit, main

git switch main
git log --oneline  # HEAD->main, arbeit
