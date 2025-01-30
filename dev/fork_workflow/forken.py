import requests

# Gitea API URL und Zugangsdaten
GITEA_URL = "https://your-gitea-instance.com"
API_TOKEN = "your-api-token"

# Zentrales Repository
ORIGINAL_REPO_OWNER = "teacher"
ORIGINAL_REPO_NAME = "central-repo"

# Liste der Schüler
students = ["student1", "student2", "student3"]

# Funktion zum Forken eines Repositories für einen Schüler
def fork_repo_for_student(student):
    fork_url = f"{GITEA_URL}/api/v1/repos/{ORIGINAL_REPO_OWNER}/{ORIGINAL_REPO_NAME}/forks"
    headers = {"Authorization": f"token {API_TOKEN}"}
    data = {"user": student}  # Fork in den persönlichen Bereich des Schülers
    
    response = requests.post(fork_url, headers=headers, json=data)
    if response.status_code == 202:
        print(f"Repository erfolgreich für {student} geforkt.")
    else:
        print(f"Fehler beim Forken für {student}: {response.content}")

# Funktion zum Setzen der Berechtigungen
def set_repo_permissions(student):
    repo_url = f"{GITEA_URL}/api/v1/repos/{student}/{ORIGINAL_REPO_NAME}"
    headers = {"Authorization": f"token {API_TOKEN}"}
    data = {"private": True}
    
    response = requests.patch(repo_url, headers=headers, json=data)
    if response.status_code == 200:
        print(f"Berechtigungen für {student} erfolgreich gesetzt.")
    else:
        print(f"Fehler beim Setzen der Berechtigungen für {student}: {response.content}")

# Hauptprozess
for student in students:
    fork_repo_for_student(student)
    set_repo_permissions(student)
