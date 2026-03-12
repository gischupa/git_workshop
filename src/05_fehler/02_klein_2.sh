git init beispiel_2
cd beispiel_2
git branch -m main

echo "Alles gut" > datei.txt
git add .
git commit -m "alles gut"

# Hier kommt der Fehler
echo "Mist gebaut" >> datei.txt

git add .   # DAS ist anders!

# GEHT NICHT MEHR
git restore datei.txt  

#-------- LÖSUNG

echo "git log => HASH"
echo "git restore --source=<HASH> datei.txt" 

#--------- ALTERNATIV
echo "git show <HASH>:datei.txt > datei_alt.txt"
