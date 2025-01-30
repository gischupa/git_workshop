#!/bin/bash

set -x

# Anlegen des Vorlagen-Repos

akt=$PWD

cd /tmp

if [ -d vorlage ]; then
  rm -rf vorlage
fi

# init und erster Checkin
git init vorlage
cd vorlage

echo Branch umbenennen
git branch -m main

# Ersten Teil der Story als ersten Commit
head -n 27 $akt/stories/story1.md > ./story1.md
git add story1.md
git commit -m "erster Teil von Story 1"
git tag -a Step_1 -m"erster_Teil_von_Story 1"

# 2. Teil der Story
cat $akt/stories/story1.md > ./story1.md
git add story1.md
git commit -m 'komplette Story 1'
git tag -a Step_2 -m "komplette_Story_1"

# Datei für Story 2 - Teil 1
head -n 32 $akt/stories/story2.md > ./story2.md
git add story2.md 
git commit -m "erster Teil von Story 2"
git tag -a Step_3 -m "erster_Teil_von_Story_2"

# Idee 1 für Story 2
cat $akt/stories/story2_idee1.md > ./story2.md
git add story2.md 
git commit -m "Idee 1 von Story 2"
git tag -a Step_4 -m "Idee_1_von_Story_2"

# Idee 2 für Story 2
cat $akt/stories/story2_idee2.md > ./story2.md
git add story2.md 
git commit -m "Idee 2 von Story 2"
git tag -a Step_5 -m "Idee_2_von_Story_2"

#### Rechtschreibfehler in der kurzen story 2 beheben
# auschecken der "teil 1 von Story 2"
# weiße durch weise ersetzen

git checkout Step_3 -- story2.md
sed -i -e "s/weiße/weise/g" story2.md

git add . story2.md
git commit -m "Typo korrigiert"
git tag -a Step_6 -m "Typo_korrigiert"


exit 0



cat <<EOF> zentral.md
# Kurzgeschichtensammlung der Klasse XY
{{< include gini.md >}}
EOF

git add zentral.md
git commit -m "zentraldokument erstellt"
git branch -m "main"

git checkout -b susanne

cat <<EOF> gini.md
# Hänsel und Gini
Es war einmal vor langer Zeit, da lebte ein Junge Namens Hänsel mit 
seinen Eltern am Rand eines großen, dunklen Waldes.
Hänsel hatte strktes Verbot, den Wald zu betreten, da dort angeblich 
unheimliche Dinge geschahen, es sollte dort einen „Gini“ geben.
Erst letzte Woche war Hänsels Vater in den Wald gegangen und erst nach 
Stunden wankend und nicht mehr ansprechbar zurückgekehrt.
Aber wie es Verbote so an sich haben, sind sie mehr Verlockung als 
Abschreckung und so wartete Hänsel, bis eines Tages beide Eltern nicht 
zuhause waren. Dann nahm er seinen Rucksack und seinen Wanderstab
und machte sich auf den Weg in den Wald.
Am Anfang waren seine Schritte zögerlich, dann immer fester und zu seiner 
Überraschung war der Wald gar nicht finster und auch nicht sehr tief! 
Bereits nach 20 Minuten hatte er den Waldrand auf der anderen Seite 
erreicht trat hinaus auf eine Wiese oder genauer kam er an einen Zaun, 
der eine Wiese umschloss. Er folgte dem Zaun und auch den lauten
Geräuschen, die jetzt vernehmbar waren. Es dauerte nicht lange, 
da kam er an der Vorderseite eines Gebäudes an, das in heller 
Farbe gestrichen war. Vor dem Haus standen einige Autos und über der
Türe hing ein Schild mit der Aufschrift „Bei Gini -- deine Kneipe“.
...
EOF

git add gini.md
git commit -m "Gini V1 fertig"


git switch main
cat <<EOF> anleitung.txt
Liebe Schüler,
bitte erstellt euch einen eigenen Branch mit einem
in der Klasse eindeutigen Namen (z.B. Vorname).
In diesem Branch erstellt ihr dann eine kleine Kurzgeschichte.
Wenn ihr fertig seid, veröffentlicht ihr den Branch, damit ich mir
euer Werk ansehen kann.
EOF

git add anleitung.txt
git commit -m "Kurzanleitung"
git switch main

git switch susanne
git switch -c "umkehr"
cat <<EOF>> gini.md
Hänsel überlegte einige Zeit, was er nun machen sollte. In dieses Haus gehen
und nach dem seltsamen *Gini* fragen, oder umkehren und son tun, als sei dieser
Ausflug nie geschehen. Es dauerte fast eine Stunde, bis er sich entschied,
wieder nachhause zu gehen. Vielleicht wollte der Gini ja einfach nur
kleine Kinder in sein Haus locken, um sie dann über dem Feuer zu rösten.
Das war ihm wirklich zu riskant. Und so machte er sich wieder auf den Rückweg.
EOF

git add gini.md
git commit -m "Umkehr fertig"

git checkout susanne
git switch -c "bei_geani"

cat <<EOF>> gini.md
Hänsel war echt neugierig, was in diesem Haus vor sich ging.
Er schlich sich die Htreppe hinauf und lauschte an der Türe.
Nun konnte er seltsames Klirren und Stimmen erkennen. Er drückte
gegen die Türe und dicker Rauch quoll heraus. Hier hatte anscheinend
noch niemand gehört, dass das schädlich war!
Hänsel spähte hinein und erkannte viele Männer, die nebeneinander
an einem langen, hohen Tisch saßen ...
EOF

git add gini.md
git commit -m "In der Bar"

git switch umkehr
cat <<EOF>> gini.md
Als er den Wald erneut durchquert hatte und am Haus ankam, da
warteten dort schon seine Eltern. Hänsel machte sich auf eine
gewaltige Standpauke gefasst ...
EOF

git add gini.md
git commit -m "ankunft"

git merge main

git switch main
cat <<EOF>> anleitung.txt
Ihr könnt auch eigene Branches für Ideen erstellen!
EOF

git add anleitung.txt
git commit -m "Anregung Branch!"

