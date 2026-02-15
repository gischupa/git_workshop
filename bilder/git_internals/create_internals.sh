#!/bin/bash

set -x

cd /tmp
rm -rf demo

git init demo
cd demo
git branch -m main

tree .git


echo "Etwas HTML" >> homepage.html
git add homepage.html

tree .git

git ls-files --stage 

git hash-object homepage.html

git commit -m "homepage.html added"

tree .git


git log 
















