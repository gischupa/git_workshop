# Inhalt vom Dockerfile im Ordner quarto
FROM ubuntu:24.04
# Install basics
RUN apt-get update && apt-get install -y \
    wget xz-utils git pandoc texlive-full \
    curl unzip \
    && apt-get clean

# Install Quarto
RUN wget https://quarto.org/download/latest/quarto-linux-amd64.deb \
    -O /tmp/quarto.deb \
    && apt-get install -y /tmp/quarto.deb \
    && rm /tmp/quarto.deb

# Set workdir
WORKDIR /work

# Default command
CMD ["bash"]
