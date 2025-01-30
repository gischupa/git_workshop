#!/bin/bash

# Gitea API URL und Zugangsdaten
GITEA_URL="https://your-gitea-instance.com"
API_TOKEN="your-api-token"

# Zentrales Repository
ORIGINAL_REPO_OWNER="teacher"
ORIGINAL_REPO_NAME="central-repo"

# Liste der Schüler
students=("student1" "student2" "student3")

# Funktion zum Forken eines Repositories für einen Schüler
fork_repo_for_student() {
    local student="$1"
    fork_url="${GITEA_URL}/api/v1/repos/${ORIGINAL_REPO_OWNER}/${ORIGINAL_REPO_NAME}/forks"

    response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$fork_url" \
        -H "Authorization: token $API_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"user\": \"$student\"}")

    if [ "$response" -eq 202 ]; then
        echo "Repository erfolgreich für $student geforkt."
    else
        echo "Fehler beim Forken für $student: HTTP Status $response"
    fi
}

# Funktion zum Setzen der Berechtigungen
set_repo_permissions() {
    local student="$1"
    repo_url="${GITEA_URL}/api/v1/repos/${student}/${ORIGINAL_REPO_NAME}"

    response=$(curl -s -o /dev/null -w "%{http_code}" -X PATCH "$repo_url" \
        -H "Authorization: token $API_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"private\": true}")

    if [ "$response" -eq 200 ]; then
        echo "Berechtigungen für $student erfolgreich gesetzt."
    else
        echo "Fehler beim Setzen der Berechtigungen für $student: HTTP Status $response"
    fi
}

# Hauptprozess
for student in "${students[@]}"; do
    fork_repo_for_student "$student"
    set_repo_permissions "$student"
done
