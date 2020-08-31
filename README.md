# Code Server+
![cool badge icon](https://github.com/CushItRealGood/code-server-docker/workflows/Docker%20Image%20CI/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/cush/code-server)](https://hub.docker.com/r/cush/code-server)

[`code-server-docker`](https://hub.docker.com/r/cush/code-server) is browser accessible [VS Code](https://github.com/Microsoft/vscode) compiled by [cdr](https://github.com/cdr) with some addidtional tools. This project executes shell scripts that installs the latest versions of [Terraform](https://www.terraform.io/) and [AWSCLI](https://aws.amazon.com/cli/) on top of the [`code-server`](https://github.com/cdr/code-server) base image.

### Docker Run 
should operate as the following:

```bash
docker run -it -p 127.0.0.1:8080:8080 -v "$PWD:/home/coder/project" cush/code-server
```

### Docker-Compose
A docker compose example for the base image can be found [here]( https://github.com/cdr/code-server/blob/master/docker-compose.yml).
Below is a version similar to my own which shows how one would run this container in the context of using a reverse proxy and facing the internet.
```
---
version: "2"
services:
  vscode:
    image: cush/code-server:latest
    container_name: vscode
    restart: unless-stopped
    networks:
      - dockernet
    environment:
      - PUID=1000
      - GUID=1000
      - PASSWORD=${PASSWORD}
    volumes:
      - /mnt/configmount/vscode:/home
      - /home/vagrant/.ssh/:/home/coder/.ssh/ #avoid potential ssh key permission issues if using Windows storage and remote git repositories
    labels:
      - "traefik.enable=true"
      - "traefik.backend=vscode"
      - "traefik.frontend.rule=Host:code.cushenberry.com"
      - "traefik.port=8080"
      - "traefik.docker.network=dockernet"
```
