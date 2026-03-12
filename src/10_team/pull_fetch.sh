#!/bin/bash
########################
# Erstellt unterschiedliche Stände in einem 
# Arbeits-Branch zur Demonstration von fetch
#
# Dafür wird ein Server-Repo erstellt und 
# zwei Clones gezogen. Dann werden Abweichungen generiert
#
# Der ABLAUF steht in den letzten Zeilen des Scripts!!!!
#
######################

set -x

IP=192.168.3.154

repo_erstellen(){
		echo "Server-Seite"

	ssh benutzer@${IP} '
	rm -rf team1.git
	git init --bare team1.git
	cd team1.git
	git branch -m main
'
}

repo_clonen(){
	### client-Seite
	cd /tmp
	rm -rf team1
	rm -rf team2

	git clone benutzer@${IP}:/home/benutzer/team1.git
	cd team1
	git branch -m main	
}


content_in_main(){
	for i in {1..5}
	do
	  echo "Zeile $i" >> datei.txt
	  git add . && git commit -m "Step $i"
	done

	git push -u origin main
}


content_in_arbeit_1(){
	echo "Branch umschalten"
	git switch -c arbeit

	for i in {1..5}
	do
	  echo "Arbeit - Zeile $i" >> datei.txt
	  git add . && git commit -m "Arbeit - Step $i"
	done

	git push -u origin arbeit
}

clonen_des_repo(){
	cd /tmp

	git clone benutzer@${IP}:/home/benutzer/team1.git team2
}


content_in_arbeit_2(){
	cd /tmp/team1

	for i in {6..10}
	do
	  echo "Arbeit NEU - Zeile $i" >> datei.txt
	  git add . && git commit -m "Arbeit NEU - Step $i"
	done

	git push
}

###############
repo_erstellen
repo_clonen
content_in_main
content_in_arbeit_1
clonen_des_repo
content_in_arbeit_2

#### Nachfolgeaktionen ab hier:

# cd /tmp/team2
# git log
# git switch arbeit
# git log
# git fetch
# git diff arbeit origin/arbeit
# git log HEAD..origin/arbeit
# git show <HASH>
# git merge



