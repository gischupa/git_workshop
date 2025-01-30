#!/bin/bash

# Datei mit Benutzerdaten
INPUT_FILE="$1"

# Gitea-Server und Admin-Token
GITEA_SERVER="http://192.168.3.195:3000"
ADMIN_TOKEN="85fa4f837cbd3c6e277aadedb54bd89cb786ccf3"

# Prüfen, ob die Datei existiert
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Die Datei $INPUT_FILE wurde nicht gefunden!"
  exit 1
fi

# Datei zeilenweise einlesen
while IFS=',' read -r login password email; do
  # Zeilen mit leerem Login überspringen
  if [[ -z "$login" ]]; then
    continue
  fi

  echo "Erstelle Benutzer: $login, E-Mail: $email"

  # API-Aufruf zur Benutzererstellung
  curl -s -X POST "$GITEA_SERVER/api/v1/admin/users" \
    -H "Authorization: token $ADMIN_TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
      \"username\": \"$login\",
      \"email\": \"$email\",
      \"password\": \"$password\",
      \"send_notify\": false,
      \"must_change_password\": true
    }"
  echo -e "\nBenutzer $login angelegt."
done < "$INPUT_FILE"

