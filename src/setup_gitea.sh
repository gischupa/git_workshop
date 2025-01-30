#!/bin/bash
# Port 3000 muss für das Webinterface offen sein
ufw allow 3000/tcp

wget -O gitea https://dl.gitea.com/gitea/1.22.6/gitea-1.22.6-linux-amd64
chmod +x gitea

adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git

mkdir -p /var/lib/gitea/{custom,data,log}
chown -R git:git /var/lib/gitea/
chmod -R 750 /var/lib/gitea/
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

mv gitea /usr/local/bin/gitea

cat << EOF > /etc/systemd/system/gitea.service
[Unit]
Description=Gitea (Git with a cup of tea)
After=network.target
[Service]
RestartSec=2s
Type=simple
User=git
Group=git
WorkingDirectory=/var/lib/gitea/

ExecStart=/usr/local/bin/gitea web --config /etc/gitea/app.ini
Restart=always
Environment=USER=git HOME=/home/git GITEA_WORK_DIR=/var/lib/gitea

[Install]
WantedBy=multi-user.target
EOF

systemctl enable gitea
systemctl start gitea




##############
# Zusatz-Tasks

# Kopieren Reg-script
cp ./selfreg.sh /usr/local/sbin/
chmod +x /usr/local/sbin/selfreg.sh


echo "---------------------------------------"
echo Einrichten über Web  `http://ip-adresse:3000`  
echo SQLITE als Datenbank einstellen
echo **WICHTIG:** Administrator einrichten!
echo "---------------------------------------"
echo Im Anschluss das Script "tune.sh" aufrufen
