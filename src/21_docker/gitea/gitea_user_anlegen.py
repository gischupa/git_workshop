import csv
import requests
import sys

# Gitea-Server und Admin-Token
GITEA_SERVER = "http://192.168.3.195:3000"

def create_user(username, password, email, token):
    """Sendet einen API-Aufruf, um einen Benutzer zu erstellen."""
    url = f"{GITEA_SERVER}/api/v1/admin/users"
    headers = {
        "Authorization": f"token {token}",
        "Content-Type": "application/json"
    }
    payload = {
        "username": username,
        "email": email,
        "password": password,
        "send_notify": False,
        "must_change_password": True
    }
    
    response = requests.post(url, json=payload, headers=headers)
    
    if response.status_code == 201:
        print(f"Benutzer '{username}' erfolgreich angelegt.")
    else:
        print(f"Fehler beim Anlegen von Benutzer '{username}': {response.status_code} - {response.text}")

def main(input_file, token):
    """Liest die CSV-Datei und erstellt Benutzer."""
    try:
        with open(input_file, mode="r", newline="") as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                if len(row) != 3:
                    print(f"Ungültige Zeile: {row}")
                    continue

                username, password, email = row
                print(f"Erstelle Benutzer: {username}, E-Mail: {email}")
                create_user(username, password, email, token)
    except FileNotFoundError:
        print(f"Die Datei '{input_file}' wurde nicht gefunden.")
    except Exception as e:
        print(f"Ein Fehler ist aufgetreten: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Verwendung: python user_anlegen.py names.csv")
        sys.exit(1)
    
    input_file = sys.argv[1]
    token = sys.argv[2]
    main(input_file, token)

