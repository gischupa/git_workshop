
set -x

#https://www.baeldung.com/java-unit-testing-best-practices

#SOURCE_FOLGER="projekt1/src/main/java/de/alp/kurs"
#TEST_FOLDER="projekt1/src/test/java/de/alp/kurs"

#export CLASSPATH=.:/usr/share/java/junit4.jar:/usr/share/java/hamcrest-core.jar

#cp StringFlipper.java ${SOURCE_FOLDER}/
#cp StringFlipperTest.java ${TEST_FOLDER}/

cd /tmp/java
rm -rf myproject


mkdir -p myproject/{src/main/java/com/example,src/test/java/com/example,lib,out/classes,out/test-classes}
#cd myproject

cp Calculator.java myproject/src/main/java/com/example/Calculator.java
cp CalculatorTest.java myproject/src/test/java/com/example/CalculatorTest.java

cd myproject

# Beispiel: ersetze VERSION durch eine reale Version, z.B. 1.10.0
VERSION=1.10.0
mkdir -p lib
curl -L -o lib/junit-platform-console-standalone-$VERSION.jar \
  https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/$VERSION/junit-platform-console-standalone-$VERSION.jar


javac -d out/classes $(find src/main/java -name "*.java")

VERSION=1.10.0
javac -cp lib/junit-platform-console-standalone-$VERSION.jar:out/classes \
  -d out/test-classes $(find src/test/java -name "*.java")

VERSION=1.10.0
java -jar lib/junit-platform-console-standalone-$VERSION.jar \
  --class-path out/classes:out/test-classes \
  --scan-class-path
