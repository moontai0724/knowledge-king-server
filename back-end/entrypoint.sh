#!/bin/sh

chmod 775 /app -R
chown node:root /app -R
cd /app

git pull

npm install

npm run start
