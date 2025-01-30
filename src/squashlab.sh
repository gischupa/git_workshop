cd /tmp

if [ -d squashlab ]; then
  echo Lösche Squashlab
  rm -rf squashlab
fi 

git init squashlab
cd squashlab

echo "start" > hauptdatei.txt
git add . hauptdatei.txt
git commit -m "Start"

git branch -m main

git switch -c arbeit

for i in {1..10}
do
  echo "Step $i" >> anderedatei.txt
  git add anderedatei.txt
  git commit -m "Neuer Inhalt $i"
done


git switch main
echo "zwischenstopp" >> hauptdatei.txt
git add hauptdatei.txt
git commit -m "Zwischenstopp"

git switch arbeit
#git rebase -i main

# bash ~/hoefam/Neue_Fortbildungen/git_workshop/src/squashlab.sh && cp squashlab.tgz ~/hoefam/Neue_Fortbildungen/git_workshop/src/
