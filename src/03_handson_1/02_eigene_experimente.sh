#!/bin/bash

set -e
set -x

#cd .. # Eine Ebene höher, raus aus dem Arbeitsordner
git init demo
cd demo
git branch -m main


echo "Etwas HTML" >> homepage.html
git add homepage.html

git ls-files --stage   # c13 blob

###########
hash_blob=$(git ls-files --stage|cut -d" " -f 2)

###########

echo "PAUSE - TASTE"
read

git hash-object homepage.html
# liefert wieder blob

#########
hash_blob2=$(git hash-object homepage.html)
#########

git commit -m "homepage.html added"

#########
hash_commit=$(git log|grep commit|cut -d" " -f2)   # b7510
#########

##########
hash_tree=$(git cat-file -p $hash_commit|grep tree|cut -d " " -f2)
# tree 94eed
#########


#########
hash_blob3=$(git cat-file -p $hash_tree)
########


git cat-file -p $hash_commit

git cat-file -p $hash_tree

git cat-file -t $hash_blob

echo $hash_blob
echo $hash_blob2
echo $hash_blob3











