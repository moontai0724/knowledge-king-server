#!/bin/bash

# Check directory owner
if [ ! "$(stat --format '%U' .)" = "node" ]; then
  echo "[ERROR] Please check permission of code path, it should created by user at host, and map volume into /home/node/app folder."
  exit
fi

# If no data, clone repo; else, update.
if [ ! -d ./.git ]; then
  git clone https://github.com/moontai0724/knowledge-king-back-end.git .
else
  git pull
fi

# Check .env file
if [ ! -f .env ]; then
  echo "[ERROR] Please configure .env file."
  exit
fi

# Start
case $ENVIRONMENT in
  "debug" )
    npm install --save-dev
    npm run start:debug
  ;;
  "dev" )
    npm install --save-dev
    npm run start:dev
  ;;
  "prod" )
    npm install
    npm run build
    npm run start:prod
  ;;
  * )
    npm install --save-dev
    npm run start
  ;;
esac
