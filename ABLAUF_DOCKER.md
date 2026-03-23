cd 21_docker

sudo -s

bash ./docker_install.sh
usermod -aG docker benutzer

# Kopieren der Images auf die Platte
lsblk

mkdir platte
sudo mount /dev/sdb1 platte
cp -r platte/images .
sudo umount platte
rm -r platte


# Abmelden/Abmelden/Anmelden

# Demo von it-tools

docker run -d -p 8090:80 --name it-tools corentinth/it-tools

# Untersuchen
docker ps
docker image ls

docker stop it-tools
docker ps -a
docker rm it-tools
docker rmi corentinth/it-tools:latest

# MariaDB

cd ~/material/maria_db
docker load -i ~/images/images_mariadb/mariadb_12_2.tar
docker compose up -d
docker exec -it mariadb_1 bash
mariadb -h localhost -u root -p

docker compose down -v

# MariaDB mit PHP

cd ~/material/maria_db
docker load -i ~/images/images_mariadb_php/mariadb_12_2.tar
docker load -i ~/images/images_mariadb_php/phpadmin_5_2_3.tar

docker compose -f docker-compose-php.yml up -d

docker compose -f docker-compose-php.yml down -v

AUFRUF mit Browser Port 8080


# Lighttpd Simple
cd ~/material/lighttpd/simple
docker load -i ~/images/images_lighttpd_simple/lighttpd_simple.tar
docker compose up

docker compose down -v


# Lighttpd Komplexer

cd ~/material/lighttpd/komplexer
docker load -i ~/images/images_lighttpd_komplexer/lighttpd_komplexer.tar
docker compose up -d


# Gitea - simple

~/material/gitea_basic
docker network create gitea
docker load -i ~/images/images_gitea_basic/image_mysql.tar
docker load -i ~/images/images_gitea_basic/image_gitea_basic.tar
docker compose up

docker compose down -v
docker network rm gitea


# Gitea Buch
~/material/gitea_buch/gitea
bash ./setup.sh             ########### NEIN
bash ./setup_offline.sh

Labor anlegen
Key eintragen OHNE 

auf dem Client 
git clone ssh://git@192.168.3.145:222/linuxadmin/Labor.git

Buchvorlage aus dem Material ins Repo

mkdir .gitea/.workflows
Einkopieren der convert.yaml

... push

Abchecken
abholen via 4001/book.pdf

# OFFLINE

docker rmi $(docker images -q)

bash ./setup_offline.sh


#################

# Gitlab

Extra Ordner anlegen lassen

compose hin copieren

IP anpassen

gitlab_net anlegen lassen

compose up









