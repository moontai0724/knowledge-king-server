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

if [ ! -f ./certs/cert.key ]; then
  openssl req -x509 -new -nodes -sha256 -utf8 -days 3650 -newkey rsa:2048 -keyout ./certs/cert.key -out ./certs/cert.crt -config /home/node/ssl.conf
fi

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
    yarn generate
    yarn start
  ;;
esac
