# Planung
## Was soll demonstriert werden?

### Alleine schreiben / entwickeln

* Repo anlegen
* add, commit, branch
* Änderungen verwerfen
* Losgelösten Head managen

### Einzelne Dateien auschecken

git init lab1
cd lab1
echo -e '# System-Dokumentation' > main.md
echo -e '{{< include hardware.md >}}' >> main.md

echo -e '## Hardware' > hardware.qmd
echo -e "\n* server: HP-Proliant \n* platten: 5x 8TB \n* Ram: 16GB" >> hardware.qmd 


echo -e '## Installation \n Nach der Partitionierung der Platte' > inst.qmd
echo -e '


## Szenario 1
Eine Klasse erstellt einen Sammelband mit Kurzgeschichten.
Jeder Schüler muss eine Geschichte "einreichen", diese soll
aber von zwei anderen Schülern korrekturgelesen werden.
Das soll nacheinander und nicht gleichzeitig erfolgen.



## Welche Repos

Wir brauchen ein Repo für die Teilnehmer-vorlage und ein 
automatisch erstelltes für Workspace