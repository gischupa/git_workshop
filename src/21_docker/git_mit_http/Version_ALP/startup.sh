#!/bin/sh
# Das Script ist im Container auszuführen,
# da hier der Ordner /git auf root-Level liegt
# Aufruf als   setup.sh <REPO-NAME>


chmod -R 777 /git
cd /git
git init --bare ${1}.git
cd ${1}.git
git branch -m main
git config http.receivepack true 

exit 0
