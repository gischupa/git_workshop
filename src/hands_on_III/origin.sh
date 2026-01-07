#!/bin/bash

# Putzen alter Versuche
rm -rf labor1


# Anlegen des Versuchsordner
mkdir labor1
cd labor1

AKTUELL=$PWD  # aktuellen Pfad merken

# Repo "entfernt.git" anlegen
git init --bare entfernt.git

# branch auf main umbenennen
cd entfernt.git
git branch -m main
cd ..

# Repo in Ordner "lokal" clonen
git clone $AKTUELL/entfernt.git lokal

# Überblick
cd lokal
git status
