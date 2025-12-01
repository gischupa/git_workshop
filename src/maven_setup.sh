#!/bin/bash

# Name des Projekts (Standardwert, falls keiner angegeben wird)
PROJECT_NAME=${1:-meinprojekt}

echo "Erstelle Projektstruktur für: $PROJECT_NAME"

# Projektverzeichnis
mkdir -p "$PROJECT_NAME"

# Maven-Verzeichnisstruktur
mkdir -p "$PROJECT_NAME/src/main/java/de/dillingen/alp/kurs"
mkdir -p "$PROJECT_NAME/src/main/resources"
mkdir -p "$PROJECT_NAME/src/test/java/de/dillingen/alp/kurs"
mkdir -p "$PROJECT_NAME/src/test/resources"
mkdir -p "$PROJECT_NAME/src/lib"

# Beispiel Main-Klasse
cat << 'EOF' > "$PROJECT_NAME/src/main/java/de/dillingen/alp/kurs/Main.java"
package de.dillingen.alp.kurs;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hallo Welt!");
    }
}
EOF

# Beispiel Testklasse (JUnit 5)
cat << 'EOF' > "$PROJECT_NAME/src/test/java/de/dillingen/alp/kurs/MainTest.java"
package de.dillingen.alp.kurs;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class MainTest {
    @Test
    void testMain() {
        assertTrue(true);
    }
}
EOF

# Minimaler pom.xml
cat << 'EOF' > "$PROJECT_NAME/pom.xml"
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>de.dillingen/alp</groupId>
    <artifactId>kurs</artifactId>
    <version>1.0-SNAPSHOT</version>

    <dependencies>
        <!-- JUnit 5 -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter</artifactId>
            <version>5.10.0</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>3.1.2</version>
            </plugin>
        </plugins>
    </build>
</project>
EOF

echo "Projektstruktur erstellt!"
echo "Projektordner: $PROJECT_NAME"
