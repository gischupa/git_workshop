#!/bin/bash

#### HIER NOCH PARAMETRÜBERGABE ODER INTERAKTIV EINBAUEN

# Konfiguration
GITEA_URL="https://gitea.example.com"
API_TOKEN="dein_personal_access_token"
TEMPLATE_OWNER="Vorlagen-Besitzer"
TEMPLATE_REPO="Vorlagen-Repository"
NEW_REPO_NAME="Neues-Repository-Name"
NEW_REPO_OWNER="Neuer-Besitzer"

# API-Endpunkt
API_ENDPOINT="$GITEA_URL/api/v1/repos/$TEMPLATE_OWNER/$TEMPLATE_REPO/generate"

# JSON-Daten für das neue Repository
JSON_DATA=$(cat <<EOF
{
  "name": "$NEW_REPO_NAME",
  "owner": "$NEW_REPO_OWNER",
  "description": "Dies ist ein neues Repository basierend auf einer Vorlage",
  "private": false
}
EOF
)

# API-Aufruf zum Erstellen des neuen Repositories
curl -X POST "$API_ENDPOINT" \
     -H "Content-Type: application/json" \
     -H "Authorization: token $API_TOKEN" \
     -d "$JSON_DATA"
