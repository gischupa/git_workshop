# Anleitung

* Zuerst docker installieren
* docker volume create giteatransfer

Im Ordner *quarto* ausführen

    docker compose build

Im Ordner *runner*

    docker build -t gitea/act_runner_dockercli:0.3.0 .


Im Ordner *gitea* ausführen

    docker compose up -d

Aufrufen der Seite http://<ip>:4000 zum Abschließen der Konfig

Neustart aller Container

Erstellen eines Reg-Tokens für den Runner innerhalb gitea

Eintragen in die docker-compose.yml



