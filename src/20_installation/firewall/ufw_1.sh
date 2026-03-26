ufw status verbose
# sollte *inactive* liefern
# Die Firewall darf hier noch nicht aktiv sein !!!!!!!
ufw default deny incoming
ufw default allow outgoing
# ssh erlauben
ufw allow 22/tcp
# Firewall einschalten
ufw enable
ufw status verbose
