
set -x

rm -rf buch

git init buch
cd buch

git branch -m main

##### Step 1
cd ../vorlage
git checkout Step_1
cp story1.md ../buch/

cd ../buch
git add story1.md

### Step 2
cd ../vorlage
git checkout Step_2
cp story1.md ../buch/

cd ../buch
git add story1.md
git commit -m "Guter Ansatz"

###### Step 3

cd ../vorlage
git checkout Step_3
cp story2.md ../buch/

cd ../buch
git add story2.md
git commit -m "Story 2 begonnen"

git switch -c entwicklung_story_2

######### Step 4  Branches für Story 2

git switch -c story2_idee_1
git switch entwicklung_story_2
git switch -c story2_idee_2

## Idee 1 ausarbeiten
git switch story2_idee_1

cd ../vorlage
git checkout Step_4
cp story2.md ../buch/

cd ../buch
git add story2.md
git commit -m "Inhalt nach Idee1 fortgeführt"

###### Step 5
### Idee 2
git switch story2_idee_2

cd  ../vorlage
git checkout Step_5
cp story2.md ../buch/
cd ../buch
git add story2.md
git commit -m "Inhalt nach Idee 2 fortgeführt"

############# Repairs
git switch entwicklung_story_2

exit 0
cd ../vorlage
git checkout Step_6
cp story2.md ../buch/
cd ../buch
git add story2.md
git commit -m "typo 'weiße' korrigiert"

git merge story2_idee_1


