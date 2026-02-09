#!/bin/bash

IP="192.168.3.89"

cd /tmp
rm -rf projekt

git clone ${IP}:/tmp/projekt.git
cd projekt/
git branch -m main
echo "Welcome" > README.txt 
git add README.txt 
git commit -m "Initial"
git push -u origin main

cd /tmp

rm -rf projekt

git clone ${IP}:/tmp/projekt.git
cd projekt/
git status 

exit 0


