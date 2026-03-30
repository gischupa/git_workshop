
set 
cd /tmp
rm -rf fetch_lab
mkdir fetch_lab
cd fetch_lab 

# Server-Repo erstellen
git init --bare server.git 
cd server.git 
git branch -m main 

# Die Kollegen clonen
cd ..
git clone ./server.git kollege_1
git clone ./server.git kollege_2

# Kollege 1 arbeitet
cd kollege_1 
echo "Zeile 1" > datei.txt 
git add . && git commit -m "Inhalt von Kollege 1"
git push 
cd ..

# Kollege 2 holt ab
cd kollege_2
git pull

# Kollege 2 arbeitet
echo "Zeile 2 von Kollege 2" >> datei.txt
git add .
git commit -m "Änderung"
git push
cd ..

# Kollege 1 holt ab
cd kollege_1 
git pull

# Kollege 1 arbeitet weiter
echo "Datei von Kollege 1" > koll_1_datei.txt 
git add .
git commit -m "Neue Datei koll 1"
cd ..

# Kollege 2 arbeitet weiter
cd kollege_2 
echo "Datei von Kollege 2" > koll_2_datei.txt 
git add .
git commit -m "Neue Datei koll 2"

echo "Unterschiedliche Stände in verschiedenen Dateien"
