git init beispiel_3
cd beispiel_3
git branch -m main

# alles funktioniert
echo "Alles gut datei1" > datei1.txt
echo "Alles gut datei2" > datei2.txt
# ... viele Dateien
git add .
git commit -m "alles gut"

# Hier kommen DIE Fehler
echo "Mist gebaut" >> datei1.txt
echo "Mist gebaut" >> datei2.txt
# ... viele Fehler in vielen Dateien

# Rücksetzen des kompletten Projekts auf den letzten Commit 
git reset --hard HEAD 

# git reset --mixed HEAD 
# git reset HEAD 

# git reset --soft HEAD 