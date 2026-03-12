
########## VORBEREITUNG
rm -rf chars

cd /tmp
mkdir chars
cd chars

git init
git branch -m main




######### INHALTE
echo -e "a\nb\nc" > datei.txt
git add . 
git commit -m "base"

git switch -c branch_d
git switch -c branch_e

git switch branch_d
echo -e "d" >> datei.txt
git add . 
git commit -m "+d"



git switch branch_e
echo -e "e" >> datei.txt
git add . 
git commit -m "+e"
