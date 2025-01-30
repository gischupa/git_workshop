cd /tmp
git init projekt
cd projekt

echo -e "Kapitel 1" > story.md
git status

git add datei_1.txt
git status

echo -e "Eintrag 2" > datei_1.txt
git status

git diff datei_1.txt


