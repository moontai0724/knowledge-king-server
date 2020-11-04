#!/bin/sh

chown root:root /app -R
cd /app

npm install -g npm

git pull

npm install -l

case $ENVIRONMENT in
  "debug" )
    npm run start:debug
  ;;
  "dev" )
    npm run start:dev
  ;;
  "prod" )
    npm run build
    npm run start:prod
  ;;
  * )
    npm run start
  ;;
esac
