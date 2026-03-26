#!/bin/bash

########## VORBEREITUNG
rm -rf wer

cd /tmp
mkdir wer
cd wer

git init
git branch -m main

######### INHALTE

echo "start" >> datei.txt
git add . ; git commit -m "start"

## Das wird die BASE
echo "blau" >> datei.txt
git add . ; git commit -m "step 1"

##########
git switch -c branch_1
git switch -c branch_2

git switch branch_1
echo "version 1" >> datei.txt
git add . ; git commit -m "version 1"

git switch branch_2
echo "version 2" >> datei.txt
git add . ; git commit -m "version 1"

git switch main
sed -i s/blau/rot/g datei.txt
echo "version 1" >> datei.txt
git add . ; git commit -m "farbwechsel"


main      branch 1     branch 2
-----     --------     --------
start     start        start
blau      blau         blau
	      Version 1    Version 2

main
-----
start
rot
Version 1


