FROM ubuntu:20.04
     
# Installiere Git und Nginx
RUN apt-get update && apt-get install -y \
    git \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Erstelle Git-Repositorys
RUN mkdir -p ./repositories

# Kopiere das Nginx-Config
COPY nginx.conf /etc/nginx/nginx.conf

# Kopiere Beispiel-Repositories (optional)
RUN mkdir ./repositories/myrepo.git && \
          ./repositories/myrepo.git && \
          git init --bare

# Nginx- und Git-Ports freigeben
EXPOSE 80 9418

# Starte nginx
CMD ["nginx", "-g", "daemon off;"]