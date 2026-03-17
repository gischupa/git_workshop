#!/bin/bash

set -e
set -x

base=$PWD

cp -r vorlagen/* .

# Erstellen von Quarto
cd quarto
#docker compose build


# Erstellen des Runners
cd $base
cd runner
#docker build -t gitea/act_runner_dockercli:latest .


# gitea und db Starten
cd $base
docker compose up server db -d

echo "Konfiguriere gitea im Frontend" 
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
docker run --rm --network gitea alpine:latest  \
    sh -c "apk add --no-cache openssh && ssh-keyscan -p 22 gitea" > ssh_keys/known_hosts


# Im Runner-Config-file den pfad zu den Host-Keys sed-en
sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" config.yaml
sed -i -e "s~SSH_LOCATION~${base}/ssh_keys~g" docker-compose.yml


cd $base 
docker compose down
docker compose up

exit 0

