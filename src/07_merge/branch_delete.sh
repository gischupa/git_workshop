
#!/bin/bash
cd
rm -rf git-branch-demo
mkdir git-branch-demo
cd git-branch-demo
git init
git branch -m main

echo "A" > file.txt
git add file.txt && git commit -m "A"
git tag "A"


echo "B" >> file.txt
git commit -am "B"
git tag "B"

# Branch eröffnen
git switch -c feature

echo "E" >> file.txt
git commit -am "E"
git tag "E"

echo "F" >> file.txt
git commit -am "F"
git tag "F"

echo "G" >> file.txt
git commit -am "G"
git tag "G"

# Rest von main entwickeln

git switch main

echo "C" >> file.txt
git commit -am "C"
git tag "C"

echo "D" >> file.txt
git commit -am "D"
git tag "D"

# Optional: Graph anzeigen

git log --oneline --graph --all --decorate
