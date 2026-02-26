
########## VORBEREITUNG
rm -rf luecke

cd /tmp
mkdir luecke
cd luecke

git init
git branch -m main




######### INHALTE
touch datei.txt
git add . 
git commit -m "base"

git switch -c branch_1
echo "1" >> datei.txt
echo "" >> datei.txt
echo "" >> datei.txt
echo "4" >> datei.txt
echo "" >> datei.txt
echo "" >> datei.txt
echo "7" >> datei.txt
echo "" >> datei.txt
echo "" >> datei.txt

git add .
git commit -m "branch 1"

git switch main
git switch -c branch_2
echo "" >> datei.txt
echo "2" >> datei.txt
echo "" >> datei.txt
echo "" >> datei.txt
echo "5" >> datei.txt
echo "" >> datei.txt
echo "" >> datei.txt
echo "8" >> datei.txt
echo "" >> datei.txt

git add .
git commit -m "branch 2"
