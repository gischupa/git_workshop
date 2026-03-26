#!/bin/bash

# Erstellt ein Repository "projekt.git" und gibt
# den Inhalt über tree aus.

set -e
set -x

cd /tmp
rm -rf projekt*
mkdir projekt.git
cd projekt.git
git init --bare 
git branch -m main
tree /tmp/projekt.git

exit 0
