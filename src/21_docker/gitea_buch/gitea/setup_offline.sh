#!/bin/bash

# Hier gehen wir davon aus, dass die Images als lokale tar-files vorliegen.
# Das Script muss aus dem Container mit der docker-compose.yml 
# heraus gestartet werden.

# Die IMAGES müssen unter /home/benutzer/images so liegen, wie sie 
# im Material bereitgestellt sind - oder der Pfad muss im 
# Script angepasst werden!

set -e
set -x

export IMAGE_BASE="$HOME/images/images_gitea_buch"
export base=$PWD

function clean_up {
    docker compose down -v
    docker network rm gitea
    docker volume rm giteatransfer
    
    docker rmi $(docker images -q)

}


function images_laden {
    # Images laden
    echo "Lade Images"
    docker load -i $IMAGE_BASE/act_runner.tar  
    docker load -i $IMAGE_BASE/alpine.tar  
    docker load -i $IMAGE_BASE/gitea.tar  
    docker load -i $IMAGE_BASE/mysql.tar  
    docker load -i $IMAGE_BASE/nginx.tar
    docker load -i $IMAGE_BASE/quarto-small.tar
    
    # Erstellen von Quarto
    cd $base
    cd quarto
    #docker compose build  --pull=false


    # Erstellen des Runners
    echo "Runner Image aktualisieren"
    cd $base
    cd runner
    docker compose build --pull=false
    #docker build -t gitea/act_runner_dockercli:0.3.0 .
}


function vorbereiten {
    cd $base
    
    # Frische Dateien holen
    cp -r vorlagen/* .

    echo "Ersetze Platzhalter"
    # Platzhalter ersetzen
    sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" config.yaml
    sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" docker-compose.yml

    echo "Erstelle externe Ressourcen"
    # Externes Netz und Volume anlegen
    docker network create gitea
    docker volume create giteatransfer
}


function start_prep {
    # gitea und db Starten
    cd $base
    docker compose up server db -d

    echo "Konfiguriere gitea im Frontend: http://<SERVER-IP>:4000 " 
    echo "Nach Fertigstellung hier die ENTER-Taste drücken"

    read
}


function config_runner {
    # Auslesen des Runner-Tokens
    runnertoken=$(docker exec -u git gitea gitea actions  generate-runner-token)


    echo "---------------------------------------------------------"
    echo $runnertoken
    echo "---------------------------------------------------------"

    # In der Compose das Token eintragen
    sed -i -e "s/RUNNERTOKEN/$runnertoken/g" docker-compose.yml

    # Lesen des Host-Keys von gitea und in die Datei schießen
    docker run --rm --network gitea alpine:3.23.3 \
        sh -c "apk add --no-cache openssh && ssh-keyscan -p 22 gitea" > ssh_keys/known_hosts
}


function start_final {
    cd $base 
    docker compose down
    docker compose up
}


images_laden
vorbereiten
start_prep
config_runner
start_final

exit 0

