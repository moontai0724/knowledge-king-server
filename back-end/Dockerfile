FROM node:latest

EXPOSE 80

RUN mkdir -p -m 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

COPY ./entrypoint.sh /root/entrypoint.sh

RUN chmod 775 /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
