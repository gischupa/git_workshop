#!/bin/bash

# OpenID deaktivieren
INI="/etc/gitea/app.ini"
KEY1="ENABLE_OPENID_SIGNIN = "
KEY2="ENABLE_OPENID_SIGNUP = "
sed -i "s/${KEY1}true/${KEY1}false/g" $INI 
sed -i "s/${KEY2}true/${KEY2}false/g" $INI 

# Sicherheit

for KEY in INTERNAL_TOKEN SECRET_KEY JWT_SECRET LFS_JWT_SECRET
do 
  VAL=$(gitea generate secret ${KEY})
  sed -i "s/^$KEY[[:space:]]*=.*/$KEY = $VAL/" $INI
done

systemctl restart gitea