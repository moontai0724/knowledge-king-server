#!/bin/sh

rm -rf /app/src
mkdir -pm 0755 /app/src
cd /app/src

git clone git@github.com:moontai0724/knowledge-king-back-end.git .

cp ../.env .

npm install

npm run start
