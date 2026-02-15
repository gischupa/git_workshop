
cd /tmp

if [ -d projekt ]; then
  rm -rf projekt
fi

git init projekt
cd projekt

git config --worktree user.name "Susi Sandmann"
git config --worktree user.email=susi@sandmann.de

git branch -m main

echo '--------------------'

echo -e '#!/bin/python3' > snake.py
echo -e '#Projektbeginn' >> snake.py
git status

echo '--------------------'

git add snake.py
git status

echo '--------------------'

echo -e 'class Main():' >> snake.py
echo -e '    pass:' >> snake.py
git status

echo '--------------------'

git add snake.py
git commit -m 'Klasse angelegt'
