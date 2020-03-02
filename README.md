# Code Server + Terraform + AWS CLI
`code-server-terraform-awscli` is [VS Code](https://github.com/Microsoft/vscode) compiled by the team at [cdr](https://github.com/cdr) and running [terraform](https://www.terraform.io/) on a remote server, accessible through the browser. The shell scripts called in the DockerFile pulls down the current versions of Terraform and AWSCLI then installs them on top of the [`code-server`](https://github.com/cdr/code-server) base image.

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



