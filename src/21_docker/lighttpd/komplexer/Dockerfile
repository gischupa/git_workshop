# Basisimage
FROM debian:bookworm-slim

# Paketliste aktualisieren und Lighttpd installieren
RUN apt-get update && \
    apt-get install -y lighttpd unzip && \
    rm -rf /var/lib/apt/lists/*

# Config kopieren
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

# ZIP kopieren
COPY website.zip /tmp/website.zip

# Entpacken
RUN unzip /tmp/website.zip -d /var/www/html \
    && rm /tmp/website.zip

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
