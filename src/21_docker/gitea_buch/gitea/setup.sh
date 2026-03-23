#!/bin/bash

set -e
set -x

base=$PWD

cp -r vorlagen/* .

# Platzhalter ersetzen
sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" config.yaml
sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" docker-compose.yml

# Externes Netz und Volume
docker network create gitea
docker volume create giteatransfer

# Erstellen von Quarto
cd $base
cd quarto
docker compose build


# Erstellen des Runners
cd $base
cd runner
docker compose build


# gitea und db Starten
cd $base
docker compose up server db -d

echo "Konfiguriere gitea im Frontend: http://<SERVER-IP>:4000 " 
echo "Nach Fertigstellung hier die ENTER-Taste drücken"

read


# Auslesen des Runner-Tokens
runnertoken=$(docker exec -u git gitea gitea actions  generate-runner-token)


echo "---------------------------------------------------------"
echo $runnertoken
echo "---------------------------------------------------------"

# In der Compose das Token eintragen
sed -i -e "s/RUNNERTOKEN/$runnertoken/g" docker-compose.yml

# Lesen des Host-Keys von gitea und in die Datei schießen
docker run --rm --network gitea alpine:3.23.3  \
    sh -c "apk add --no-cache openssh && ssh-keyscan -p 22 gitea" > ssh_keys/known_hosts



cd $base 
docker compose down
docker compose up

exit 0

