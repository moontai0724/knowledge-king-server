# Knowledge King Server Setup Kit (Build server environment)
This repository is an environment setup kit for Knowledge King server.

# What's Inside?
This kit includes following environments:
- **MySQL**:latest
- **phpMyAdmin**:latest
- **Nginx**:latest
- Back-end server using **node**:latest
- Front-end server using **node**:latest
- **code-server**:latest

## Web Path
Caused by single ip and port limitation, this kit is served by Nginx with reverse proxy.
Proxied path can see following:
```
├ /            -> Request will forward to front-end docker container.
├ /api/        -> Request will forward to back-end docker container.
├ /phpmyadmin/ -> Request will forward to phpmyadmin docker container.
```

# Getting Started
This kit is built with **Docker**, please install **Docker** and **Docker-Compose** first.
```shell
curl -sSL https://get.docker.com | sudo sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Set-up Project
### Code
Please put your code into `~/knowledge-king-back-end`, or change path at line 54 in `docker-compose.yml` file.

## Set up ssh key for access private repositories (optional now)
Don't forget to add ssh key for access private repositories (if there was no key)
```shell
mkdir ./.ssh
ssh-keygen -f ./.ssh/back-end.key
ssh-keygen -f ./.ssh/front-end.key
```
And also, don't forget to add public ssh key to **Deploy keys** in repository settings.

## Setup environment variable
Copy example file, then edit values.
```shell
copy .env.example .env
```

## Boot containers

For start all these containers, just run this command in root folder of project:
```shell
docker-compose up -d --build
```
After about a minute, all containers should successfully booted.

## MySQL Password
MySQL root password will generate when first-time boot up, keep watching console output for root password to access database.
If you run **docker-compose** with `-d` parameter, will detach from containers, you won't be able to watching console output.

If you missed the output, you can type this command to fetch logs from container for find database password.
```shell
docker logs mysql
```

## After first boot up
After you got password, you can press `Ctrl+C` to stop containers.

For start existing containers, you can use:
```shell
docker-compose start
```
