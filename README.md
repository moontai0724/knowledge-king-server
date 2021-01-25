# Knowledge King Server Setup Kit (Build server environment)
This repository is an environment setup kit for Knowledge King server.

# What's Inside?
This kit includes following environments:
- **MySQL**:latest
- **PHPMyAdmin**:latest
- **Nginx**:latest
- front-end server using **node**:latest
- front-end development using **code-server**:latest
- back-end development using **code-server**:latest
- back-end server using **node**:latest

For which version contains what environment, please check following table:

|    Package \ Version    | production | production-ssl | development | development-ssl |
| :---------------------: | :--------: | :------------: | :---------: | :-------------: |
|          MySQL          |    Yes     |      Yes       |     Yes     |       Yes       |
|       PHPMyAdmin        |     No     |       No       |     Yes     |       Yes       |
|          Nginx          |    Yes     |      Yes       |     Yes     |       Yes       |
|           SSL           |     No     |      Yes       |     No      |       Yes       |
|        Front-end        |    Yes     |      Yes       |     Yes     |       Yes       |
| code-server (front-end) |     No     |       No       |     Yes     |       Yes       |
|        Back-end         |    Yes     |      Yes       |     Yes     |       Yes       |
| code-server (back-end)  |     No     |       No       |     Yes     |       Yes       |

## Web Path
This kit is served by Nginx with reverse proxying by path.
Proxied path here:
```
├ /                    -> Requests will forward to front-end docker container.
├ /api/                -> Requests will forward to back-end docker container.
├ /phpmyadmin/         -> Requests will forward to phpmyadmin docker container.
├ /front-end-coding/   -> Requests will forward to front-end code-server docker container.
├ /back-end-coding/    -> Requests will forward to back-end code-server docker container.
```

# Getting Started
This kit is built with **Docker**, please install **Docker** and **Docker-Compose** first.
```shell
curl -sSL https://get.docker.com | sudo sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Setup environment variable
Copy example file, then edit values.
```shell
copy .env.example .env
```

## Set SSL Certificate (Optional, SSL version only)
If you're using SSL version, it's necessary to having a SSL certificate.
To use SSL, you need to save cert as `cert.pem` and `cert.key` in `./certs`.

## Setup SSH key for (Optional, Development version only)
If you're going to development, please don't forget to generate an ssh key, and add it into repo deploy keys.
```shell
ssh-keygen
```

## Boot containers
For start all these containers, just run this command in root folder of project:
```shell
docker-compose -f docker-compose-{version}.yml up -d --build
```
For example, if you decide to use `production-ssl` version, please use following command:
```shell
docker-compose -f docker-compose-production-ssl.yml up -d --build
```
After about a minute, all containers should successfully booted.

## MySQL Root Password
MySQL root password will generate when first-time boot up, keep watching console output for root password to access database.
If you run **docker-compose** with `-d` parameter, will detach from containers, you won't be able to watching console output.

If you missed the output, you can type this command to fetch logs from container for find database password.
```shell
docker logs mysql
```
