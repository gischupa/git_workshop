#!/bin/bash

# Name des Projekts (Standardwert, falls keiner angegeben wird)
PROJECT_NAME="java_01"

echo "Erstelle Projektstruktur für: $PROJECT_NAME"

cd /tmp

# Projektverzeichnis
mkdir -p "$PROJECT_NAME"

# Maven-Verzeichnisstruktur
mkdir -p "$PROJECT_NAME/src/main/java/de/dillingen/alp/kurs"
mkdir -p "$PROJECT_NAME/src/main/resources"
mkdir -p "$PROJECT_NAME/src/test/java/de/dillingen/alp/kurs"
mkdir -p "$PROJECT_NAME/src/test/resources"
mkdir -p "$PROJECT_NAME/src/lib"


echo "Projektstruktur erstellt!"
echo "Projektordner: $PROJECT_NAME"
