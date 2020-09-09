#!/bin/sh

chown node:root /app -R
cd /app

git pull

npm install

case $ENVIRONMENT in
  "debug" )
    npm run start:debug
  ;;
  "dev" )
    npm run start:dev
  ;;
  "prod" )
    npm run start:prod
  ;;
  * )
    npm run start
  ;;
esac
