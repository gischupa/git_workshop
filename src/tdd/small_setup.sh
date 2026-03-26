#!/bin/bash

set -x

base="/tmp"
java=${base}/java2
projekt=${java}/projekt

# Anlegen der Ordner
rm -rf $java 
mkdir -p $projekt  

mkdir -p ${projekt}/src/main/java/de/alp/kurs
mkdir -p ${projekt}/src/test/java/de/alp/kurs
mkdir -p ${projekt}/lib
mkdir -p ${projekt}/out/classes
mkdir -p ${projekt}/out/test-classes


# kopieren der Quell und Testdateien astatt zu schreiben!
cp ./StringFlipper.java      ${projekt}/src/main/java/de/alp/kurs
cp ./StringFlipperTest.java  ${projekt}/src/test/java/de/alp/kurs
cp ./junit5.jar              ${projekt}/lib/


# Beginnen mit dem Labor
cd ${projekt}
javac -d out/classes       src/main/java/de/alp/kurs/StringFlipper.java
javac -d out/test-classes  -cp lib/junit5.jar:out/classes src/test/java/de/alp/kurs/StringFlipperTest.java

# Ausführen des 