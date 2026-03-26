#!/bin/bash
set -x

cd /tmp
git init branchlabor
cd branchlabor

touch a.txt
git add a.txt
git commit -m "init"

#git branch -m main
git switch -c branch1
git switch master
git switch -c branch2


for i in {1..5}; do 
  git switch  branch1
  echo "branch_1 $i" > datei_b1_$i.txt
  git add datei_b1_$i.txt
  git commit -m "datei_b_1_$i.txt"

  sleep 1
  git switch  branch2
  echo "branch_2 $i" > datei_b2_$i.txt
  git add datei_b2_$i.txt
  git commit -m "datei_b2_$i.txt"
  sleep 1
done 


git switch branch1
#git merge branch2
