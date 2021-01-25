#!/bin/bash

# Check directory owner
if [ ! "$(stat --format '%U' .)" = "node" ]; then
  echo "[ERROR] Please check permission of code path, it should created by user at host, and map volume into /home/node/app folder."
  exit
fi

# If no data, clone repo; else, update.
if [ ! -d ./.git ]; then
  git clone https://github.com/moontai0724/knowledge-king-front-end.git .
fi

git remote set-url origin https://github.com/moontai0724/knowledge-king-front-end.git
git remote set-url --push origin git@github.com:moontai0724/knowledge-king-front-end.git
git pull

yarn install

# Start
case $ENVIRONMENT in
  "dev" )
    yarn dev
  ;;
  "test" )
    yarn test
  ;;
  * )
    yarn build
    yarn start
  ;;
esac
