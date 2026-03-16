#!/bin/sh

chmod -R 777 /git
cd /git
git init --bare ${1}.git
cd ${1}.git
git branch -m main
git config http.receivepack true 

exit 0
