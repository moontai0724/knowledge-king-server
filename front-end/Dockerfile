FROM node:latest
EXPOSE 80

USER node

RUN mkdir -p -m 0700 /home/node/.ssh && \
  ssh-keyscan github.com > /home/node/.ssh/known_hosts

COPY --chown=node:node ./entrypoint.sh /home/node/entrypoint.sh
COPY --chown=node:node ./ssl.conf /home/node/ssl.conf

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

ENTRYPOINT ["sh", "/home/node/entrypoint.sh"]
