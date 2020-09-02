FROM node:latest

WORKDIR /app/src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 80

CMD npm run start
