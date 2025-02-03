# Ubuntu 20.04 als Basis
FROM ubuntu:20.04

# Umgebungsvariablen setzen, um tzdata ohne Benutzerinteraktion zu installieren
ENV DEBIAN_FRONTEND=noninteractive

# Installiere benötigte Pakete (Git, Nginx, fcgiwrap)
RUN apt-get update && apt-get install -y \
    git \
    nginx \
    spawn-fcgi \
    fcgiwrap \
    && rm -rf /var/lib/apt/lists/*

# Erstelle Git-Repositories Verzeichnis
RUN mkdir -p /repositories

# Kopiere Nginx-Konfiguration ins Container-Dateisystem
COPY nginx.conf /etc/nginx/nginx.conf

# Erstelle ein Beispiel-Repository (optional)
RUN mkdir /repositories/myrepo.git && \
    cd /repositories/myrepo.git && \
    git init --bare

# Exponiere Ports für Git und Nginx
EXPOSE 80 9418

# Start Nginx und fcgiwrap im Hintergrund
CMD service nginx start && spawn-fcgi -s /var/run/fcgiwrap.socket -u www-data -g www-data /usr/sbin/fcgiwrap && tail -f /dev/null
