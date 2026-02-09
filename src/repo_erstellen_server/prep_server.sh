#!/bin/bash

set -e
cd /tmp
rm -rf projekt*
mkdir projekt.git
cd projekt.git
git init --bare 
git branch -m main
tree /tmp/projekt.git

exit 0
