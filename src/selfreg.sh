#!/bin/bash

# Datei und Schlüssel definieren
CONFIG_FILE="/etc/gitea/app.ini"
KEY="DISABLE_REGISTRATION"

# Funktion, um den Wert zu setzen
set_value() {
  local value=$1
  
  if [[ "$value" == "off" ]]; then
    sed -i "s/^$KEY[[:space:]]*=.*/$KEY = true/" "$CONFIG_FILE"
    echo "Selbstregistrierung deaktiviert - Seite neu laden"
  elif [[ "$value" == "on" ]]; then
    sed -i "s/^$KEY[[:space:]]*=.*/$KEY = false/" "$CONFIG_FILE"
    echo "Selbstregistrierung aktiviert - Seite neu laden"
  else
    echo "Ungültiger Parameter: Bitte verwenden Sie 'on' oder 'off'."
    exit 1
  fi
}

# Prüfen, ob ein Parameter übergeben wurde
if [[ $# -ne 1 ]]; then
  echo "Benutzung: $0 [on|off]"
  exit 1
fi

# Hauptlogik
check_file
set_value "$1"
systemctl restart gitea
