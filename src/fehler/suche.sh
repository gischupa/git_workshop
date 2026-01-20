git init suche
cd suche
git branch -m main

for i in {1..5};do 
 echo "Version $i" > datei.txt 
 git add .
 git commit -m "Version $i"
done 

echo "gewünschte Version" > datei.txt 
git add .
git commit -m "Version 6"

for i in {7..10};do 
 echo "Version $i" > datei.txt 
 git add .
 git commit -m "Version $i"
done 