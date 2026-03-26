# Basisimage
FROM debian:bookworm-slim

# Paketliste aktualisieren und Lighttpd installieren
RUN apt-get update && \
    apt-get install -y lighttpd && \
    rm -rf /var/lib/apt/lists/*

# Config ersetzen
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

# Website kopieren
COPY index.html /var/www/html/index.html

# Port dokumentieren
EXPOSE 80

# Lighttpd im Vordergrund starten
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
