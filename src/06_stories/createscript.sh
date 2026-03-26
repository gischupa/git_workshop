rm -rf vorlage buch

git init vorlage
cd vorlage
git branch -m main

head -n 29 ../story1.md > story1.md

git add .
git commit -m "Story_1 Teil1"
git tag "Step_1"

cp ../story1.md .
git add .
git commit -m "Story_1 komplett"
git tag "Step_2"

#######################

head -n 50 ../story2_teil1.md > story2.md
git add .
git commit -m "Story 2 begonnen"
git tag "Step_3"


cp ../story2_idee1.md story2.md
git add .
git commit -m "Idee1"
git tag "Step_4"

cp ../story2_idee2.md story2.md
git add .
git commit -m "Idee2"
git tag "Step_5"

# In Sept  6 geht es um einen Rechtschreibfehler
cp ../story2_teil1_weise.md story2.md
git add .
git commit -m "Story2 ß->s"
git tag "Step_6"





