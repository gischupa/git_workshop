---
title: "Maria-DB"
author: "Wolfgang Höfer"
format: 
  pdf:
    documentclass: scrreprt
    lang: "de"
    keep-tex: true
    include-in-header: 
      text: |
        \usepackage{my_quarto_tools}
        \usepackage{enumitem}
        \usepackage{changepage}
        \setlist[description]{style=nextline, leftmargin=2.5em}
        \newcommand{\cmd}[1]{\texttt{#1}\xspace}
jupyter: python3
---

\newcounter{anr}
\setcounter{anr}{1}

## Reines Mariadb

Hier wird die Erstellung mittels Dockerfile beschrieben.
Im Kurs-Handout kommt NUR `docker compose` zum Einsatz!

### Dockerfile erstellen

Ordner und Dockerfile erstellen

```bash
mkdir maria
cd maria
nano Dockerfile
```

Alle Einrückungen in dieser Datei müssen 
mit Leerzeichen und nicht mit Tabulatoren erfolgen!
Zum einfacheren Zählen deute ich Leerzeichen **am Anfang der Zeile** mit 
Punkten an.


**Image festlegen**
```bash
FROM mariadb:11   # vermeide "latest"
```

**Variablen festlegen**  
(Können auch manuell in Umgebungsvariablen geschrieben werden, wenn Sicherheit ein Thema ist. )

```bash
# ENV Variablen für MariaDB
ENV MARIADB_ROOT_PASSWORD=rootpass
ENV MARIADB_DATABASE=mydatabase
ENV MARIADB_USER=myuser
ENV MARIADB_PASSWORD=mypassword
```

**Speicherort der Daten**  
Info für Docker, welcher Ordner externe Daten enthält
```bash
# Datenverzeichnis
VOLUME ["/var/lib/mysql"]
```

**Nur zur Doku**  
```bash
# Standard MariaDB Port
EXPOSE 3306
```


### Erstellen des Images
```bash
docker build -t my-mariadb .   # Punkt ist wichtig!
```

### Starten des Containers
```bash
docker run -d \
  --name mariadb-container \
  -p 3333:3306 \
  -v $(pwd)/data:/var/lib/mysql \
  my-mariadb
```
### Erweiterung auf externes Config-File

Ergänzung Dockerfile
```bash
VOLUME ["/etc/mysql/conf.d"]
```

Image neu bauen
```bash
docker build -t my-mariadb .   # Punkt ist wichtig!
```

Neuer Startaufruf
```bash
docker run -d \
  --name mariadb-container \
  -p 3333:3306 \
  -v $(pwd)/data:/var/lib/mysql \
  -v $(pwd)/my.cnf:/etc/mysql/conf.d/my.cnf \
  my-mariadb
  ```
  
<pagebreak>

## MariaDB mit phpmyadmin

**Prinzip:** Ein Dienst pro Container   

Verwendung von Docker-Compose zur Verwaltung 
mehrerer Container.

### 


mkdir mariadb-stack
cd mariadb-stack

mkdir data

mkdir config


# Compose-File
(Jeder Level der Einrückung sind 2 Leerzeichen)
# dockercompose.yaml
```bash
version: "3.9"

services:
  mariadb:
    image: mariadb:11
    container_name: mariadb
    restart: unless-stopped

    ports:
      - "3333:3306"

    environment:
      MARIADB_ROOT_PASSWORD: rootpass
      MARIADB_DATABASE: mydatabase
      MARIADB_USER: myuser
      MARIADB_PASSWORD: mypassword

    volumes:
      - ./data:/var/lib/mysql
      
      
  phpmyadmin:
    image: phpmyadmin:latest
    container_name: phpmyadmin
    restart: unless-stopped
    ports:
      - "8080:80"
    environment:
      PMA_HOST: mariadb
      PMA_PORT: 3306

    volumes:
      - ./data:/var/lib/mysql
      - ./config/my.cnf:/etc/mysql/conf.d/my.cnf
```

nano config/my.cnf

[mysqld]
sql_mode=STRICT_TRANS_TABLES





# Mehrere Instanzen

Bei groß dimensionierter Hardware kann man auch überlegen,
Arbeitsgruppen einen eigenen Server zu *spendieren*. 
Hier ist es aber wirklich wichtig, viel RAM und CPUs zu besitzen.
Die Gruppen werden nachfolgend als USER bezeichnet.

**compose-template.yml**  
```bash
version: "3.9"

services:
  mariadb:
    image: mariadb:11
    container_name: mariadb_${USER}
    restart: unless-stopped
    ports:
      - "${PORT}:3306"
    environment:
      MARIADB_ROOT_PASSWORD: ${ROOTPASS}
      MARIADB_DATABASE: ${DB}
      MARIADB_USER: ${USER}
      MARIADB_PASSWORD: ${PASS}
    volumes:
      - ./data:/var/lib/mysql
      - ./config/my.cnf:/etc/mysql/conf.d/my.cnf

  phpmyadmin:
    image: phpmyadmin:latest
    container_name: phpmyadmin_${USER}
    restart: unless-stopped
    ports:
      - "${PMA_PORT}:80"
    environment:
      PMA_HOST: mariadb_${USER}
      PMA_PORT: 3306
```

Nachfolgendes Script `create_server.sh`  kann dann für jede Gruppe 
aufgerufen werden:

```bash
#!/bin/bash

USER=$1
PORT=$2
PMA_PORT=$3

mkdir -p $USER/{data,config}

cp compose-template.yml $USER/docker-compose.yml

cat > $USER/.env <<EOF
USER=$USER
PORT=$PORT
PMA_PORT=$PMA_PORT
ROOTPASS=rootpass_${USER}
DB=db_${USER}
PASS=pass_${USER}
EOF

cd $USER
docker compose up -d
```


**Verwendung**  
```bash
bash create-server.sh gruppe_1 3333 8080
bash create-server.sh gruppe_2 3334 8081
```

