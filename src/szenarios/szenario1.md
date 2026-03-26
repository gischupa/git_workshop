# Szenario 1

Wir erstellen in diesem Szenario ein kleines Buch
mit Kurzgeschichten.Da es zu viel Aufwand ist, die ganzen Texte
im Rahmen des Workshops zu erstellen, gehen wir einen 
anderen Weg. Ich habe die Einzeltexte von einer KI erstellen lassen und 
bereits als git-Repository bereit gestellt.  
Auch wenn es vom Ablauf her relativ sinnols ist, 
werden wir dieses Repository Schritt für Schritt in 
ein eigenes Repository „umziehen“.
Dabei kopieren wir Schritt für Schritt nach Anleitung die einzelnen
Dateien in das eigene Repository. Dabei bekommen wir auch gleich einen
Leitfaden für die Durchführung eines derartigen Projekts mit Schülern.  

Als Textformat verwenden wir Markdown und für die Umwandlung 
in ein PDF lassen wir später Quarto/pandoc für uns die Arbeit 
erledigen -- das kommt aber viel später erst

## Routine aufbauen

### Schritt 1

Unsere Dateiquelle bereitstellen

```bash
git clone ....
```

Eigenes Repo anlegen

```bash
git init book
```

### Schritt 2

Das Story-Projekt beginnen. Die Kapitel der Geschichte befinden sich 
eigenen Dateien und werden in einer Master-Datei zusammengeführt.
Das ist auch die Stelle, wo später die Schüler kooperativ arbeiten 
können. Da wir alleine entwickeln/schreiben haben wir aber eine
einfacheren Workflow.
Quarto/pandoc benötigt einige Konfigurationsdateien und -ordner,
die im Muster-repository bereits vorhanden sind.

Kopiere den aktuellen Inhalt des Repositories in dein eigenes 
Repository. Achte daruaf, den Ordner `.git` **NICHT** zu kopieren!
Die Datei *index.md* dient als Zentraldokument der Geschichte, in die 
dann die Kapitel oder Einzelstories eingebunden werden.  
  
Aus dem aktuellen Stand machen wir einen Commit:

```bash
git add . --all
git commit -m "Basis des Projekts erstellt"
git log # Nur zur Demo!
git log --oneline # Auch nur zur Demo
```

### Schritt 3

Eine der Möglichkeiten von Git ist es, dass man verschiedene
Entwicklungsstufen eines Projektes nacheinander durchlaufen kann.
Das ist nicht der eigentliche Sinn von Git -- aber eben auch
eine Anwendung.

Die nächste Stufe des Book-Projekts erhalten wir durch 
den Befehl 

```bash
git switch stufe1
```

Wir werden uns Stufe für Stufe durch das Projekt arbeiten.
Einen Überblick über die vorhandenen Stufen liefert 
der Befehl 

```bash
git branch
```

Es hat keinen Sinn *zu springen*, da einige Stufen für
Varianten reserviert sind.

Kopiere die aktuell vorhandenen `*.md*` Dateien 
ins eigene Repository.

-------------------
Das sind index.md und story1.md
Hier sind nun der include befehl und ein erster Teil einer
Kurzgeschichte drinnen
-------------------

Welche Änderungen nun vorliegen zeigt 

```bash
git diff
```

Du siehst, wie sich der Inhalt der Datei `index.md`
geändert hat. Lege den aktuellen Stand auf den Stage:

```bash
git add . --all
git commit -m "erste Geschichte eingebunden"
```

### Schritt 4

Da die nächsten Geschichten erst als Arbeitsversionen
geliefert werden, sollten sie nicht bei den fertigen
Geschichten liegen. Deshalb erstellst du einen Branch
mit dem Namen *unfertig*:

```bash
git checkout -b unfertig    # alte Version de Befehls
git switch -c unfertig    # neue Version des Befehls
```

Kontrolle, ob das geklappt hat

```bash
git branch
```

Wechsle ins Quellen-Repo und wechsle zu Stufe 2:

```bash
git switch stufe2
```


### Schritt 5

Jetzt sind die Dateien story2.md und story3.md dazu gekommen.
Kopiere einfach alle `*md` Dateien in dein Repository.

Sie befinden sich nun im Branch unfertig und du erstellst 
einen Commit.

```bash
git add . --all
git commit -m "2 & 3 rohfassung"
```

### Schritt 6

Du machst ein paar Änderungen in den beiden Dateien.
Durch `git diff` kannst du die Änderungen auch 
zur Kontrolle noch einmal ansehen.

Du fügst die Dateien dem Stage hinzu:

```bash
git add . --all
```

Für einen Commit ist es noch zu früh, denn
du musst die Dateien noch in die `index.md` 
aufnehmen ... mach das.

```bash
git status
```

Du siehst, dass nur die `index.md` verändert wurde.
Lege sie auf den Stage und führe einen Commit durch:

```bash
git add index.md
git commit -m "2 und 3 fertig"
```

### Schritt 7
Nun müssen die neuen Geschichten in den Hauptzweig 
übertragen werden:

```bash
git switch main
git merge unfertig
```

Nachdem neue Geschichten aber immer im Zweig *unfertig*
erstellt werden, wechselst du wieder dort hin:

```bash
git switch unfertig
```

## Etwas komplexer

Beim Programmieren sind mehrere Zweige üblich, 
bei einem Buch eher weniger -- es wirkt nun also etwas gekünstelt!
Du hast einen Branch *unfertig* von vorher und willst sort weiterhin deine
Geschichten schreiben. Weil du auch ab und zu Ideen hast, die nicht zum
aktuellen Text passen, legst du dir einen Branch *ideen* an.

```bash
git switch main
git switch -c ideen
```