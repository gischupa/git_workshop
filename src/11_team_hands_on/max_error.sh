IP=192.168.3.154
# Nützliche Variablen
ARBEIT=/tmp  # aktuellen Pfad merken 
SUSI=$ARBEIT/susi  # Abkürzungen für den Überblick  
MAX=$ARBEIT/max

# Susi
cd $SUSI
echo "Hallo Welt, sagt Susi" >> datei_susi.txt
git add datei_susi.txt
git commit -m "Hallo von Susi"

git push

# Max
cd $MAX
echo "Hallo Welt, sagt Max" >> datei_max.txt
git add datei_max.txt
git commit -m "Hallo von Max"

git push


