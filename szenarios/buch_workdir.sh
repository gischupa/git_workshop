#!/bin/bash
set -x
# Anlegen des Vorlagen-Repos

aktuell=$PWD
tmp="/tmp"
vorlage=$tmp/vorlage
arbeit=$tmp/fortbildung/buch

cd $tmp

if [ -d fortbildung ]; then
  rm -rf fortbildung
fi

mkdir fortbildung
cd fortbildung


# init und erster Checkin
git init buch
cd $arbeit

echo Branch umbenennen
git branch -m main

# Ersten Teil der Story als ersten Commit
cd $vorlage; git checkout Step_1; cd $arbeit
cp $vorlage/story1.md .

echo erster add
git add story1.md


#Volle Story
cd $vorlage; git checkout Step_2; cd $arbeit
cp $vorlage/story1.md .

# erster Commit
git add story1.md
git commit -m 'Guter Ansatz'

# Branch entwicklung_story_2
git switch -c entwicklung_story_2

# Geschichte 2 beginnen
cd $vorlage; git checkout Step_3; cd $arbeit
cp $vorlage/story2.md .

# Basiscommit story2
git add story2.md 
git commit -m "Story 2 begonnen"


# branches für Ideen
git switch -c story2_idee_1
git switch entwicklung_story_2
git switch -c story2_idee_2

# Idee 1 beginnen und gleich commiten
git switch story2_idee_1
cd $vorlage; git checkout Step_4; cd $arbeit
cp $vorlage/story2.md .
git add story2.md
git commit -m "Inhalt nach Idee1 fortgeführt"

# Zu idee 2 wechseln
git switch story2_idee_2
cd $vorlage; git checkout Step_5; cd $arbeit
cp $vorlage/story2.md .
git add story2.md
git commit -m "Inhalt nach Idee2 fortgeführt"


# Typo "weiße" ausbessern
git switch entwicklung_story_2
cd $vorlage; git checkout Step_6; cd $arbeit
cp $vorlage/story2.md .
git add story2.md
git commit -m "typo 'weiße' korrigiert"

##################### Erster Merge
# Merge in den Entwicklungszweig 
git merge  story2_idee_1


# Tier ändern
git switch story2_idee_1 
sed -i -e "s/Schildkröte/Riesenschildkröte/g" story2.md
git add story2.md 
git commit -m "Riesenschildkröte"
git switch entwicklung_story_2
git merge  story2_idee_1


exit 0
########### Hier kommt der Merge-Konflikt

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

