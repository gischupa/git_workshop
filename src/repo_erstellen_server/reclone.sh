#!/bin/bash

# Erstellt auf dem Server ein Repo
# Verwendet wird Port 23

# Macht dann einen kompletten Zyklus von 
# Clonen, ändern, pushen
# dann löschen
# und den neuen Stand clonen.

# Ging um die Frage, ob main auf dem Client ankommt.

IP="192.168.3.154"
PFAD="/tmp/projekt.git"

ssh -p 23 benutzer@${IP} '
rm -rf /tmp/projekt.git
mkdir -p /tmp/projekt.git
cd /tmp/projekt.git
git init --bare
git branch -m main
'

# Lokal
cd /tmp
rm -rf projekt

git clone ssh://benutzer@${IP}:23${PFAD}

cd projekt/
git branch -m main

echo "Welcome" > README.txt 
git add README.txt 
git commit -m "Initial"
git push -u origin main

cd /tmp

rm -rf projekt

git clone ssh://benutzer@${IP}:23${PFAD}
cd projekt/
git status 

exit 0


