# Knowledge King Server Setup Kit (Build server environment)
This repository is an environment setup kit for Knowledge King server.

# What's Inside?
This kit includes following environments:
- **MySQL**:latest
- **Nginx**:latest
- Back-end server using **node**:latest
- Front-end server using **node**:latest

For which version contains what environment, please check following table:

| Package \ Version | production | production-ssl |
| :---------------: | :--------: | :------------: |
|       MySQL       |    Yes     |      Yes       |
|       Nginx       |    Yes     |      Yes       |
|        SSL        |     No     |      Yes       |
|     Back-end      |    Yes     |      Yes       |
|     Front-end     |    Yes     |      Yes       |

## Web Path
This kit is served by Nginx with reverse proxying by path.
Proxied path here:
```
├ /             -> Requests will forward to front-end docker container.
├ /api/         -> Requests will forward to back-end docker container.
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

## Set SSL Certificate (Optional)
If you're using SSL version, it's necessary to having a SSL certificate.
To use SSL, you need to save cert as `cert.pem` and `cert.key` in `./certs`.

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
