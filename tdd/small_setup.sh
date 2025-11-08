

# Anlegen der Ordner
cd /tmp
mkdir -p /tmp/java2
cd /tmp/java2

if [ -d projekt ];
 then 
    rm -rf projekt
 fi


mkdir -p projekt/src/main/java/de/alp
mkdir -p projekt/src/test/java/de/alp
mkdir -p projekt/lib
mkdir -p projekt/out/classes
mkdir -p projekt/out/test-classes


# kopieren der Quell und Testdateien astatt zu schreiben!
cp StringFlipper.java      projekt/src/main/java/de/alp
cp StringFlipperTest.java  projekt/src/test/java/de/alp
cp junit5.jar              projekt/lib/


# Beginnen mit dem Labor
cd projekt
javac -d out/classes       src/main/java/de/alp/StringFlipper.java
javac -d out/test-classes  -cp lib/junit5.jar:out/classes src/test/java/de/alp/StringFlipperTest.java

