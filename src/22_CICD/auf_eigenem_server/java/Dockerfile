# Inhalt von Dockerfile
# Basisimage mit Java 21 (Temurin JDK)
FROM eclipse-temurin:21-jdk

# Maven-Version festlegen
ARG MAVEN_VERSION=3.9.12
ARG USER_HOME_DIR="/root"
ARG SHA=8d25376b58a36454bedc70ed87c1a507

# Installationsverzeichnisse
ARG BASE_URL=https://downloads.apache.org/
ARG MAVEN_URL=${BASE_URL}maven/maven-3/${MAVEN_VERSION}/binaries

# Maven installieren
RUN mkdir -p /opt/maven \
    && curl -fsSL ${MAVEN_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    -o /tmp/maven.tar.gz \
    && tar -xzf /tmp/maven.tar.gz -C /opt/maven --strip-components=1 \
    && rm /tmp/maven.tar.gz

# Maven in PATH eintragen
ENV MAVEN_HOME=/opt/maven
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

# Arbeitsverzeichnis setzen
WORKDIR /workspace

# Default-Command (optional)
CMD ["mvn", "--version"]
