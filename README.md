# [docker-wine](https://github.com/ifrstr/docker-wine)

Wine in Docker.

[GitHub](https://github.com/ifrstr/docker-wine)
|
[GitHub Container Registry](https://github.com/ifrstr/docker-wine/pkgs/container/docker-wine)
|
[Docker Hub](https://hub.docker.com/r/ifrstr/wine)

## Usage

### Try online

<a href="https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/ifrstr/docker-wine/master/docker-compose.yml" target="_blank"><img src="https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png" alt="Try in PWD" height="37"/></a>

### Start using Docker

```sh
docker run --rm -it -p 6080:80 -p 5901 -e VNC_PASSWD=password ifrstr/wine
```

### Start using Docker Compose

```sh
docker compose up
```

### Start using Docker Swarm

```sh
docker stack deploy --compose-file docker-compose.yml wine
```

### Connect using browser

Navigate to `http://localhost:6080` and login using `password`.

### Connect using VNC Viewer

```sh
vncviewer :1 # Connect to 127.0.0.1:5901
```

## Troubleshooting

Start bash with services:

```sh
docker run --rm -it -p 6080:80 -p 5901 -e VNC_PASSWD=password ifrstr/wine /sbin/my_init -- bash -l
```

Start bash without services:

```sh
docker run --rm -it -p 6080:80 -p 5901 -e VNC_PASSWD=password ifrstr/wine bash
```

## Building

Create a builder:

```sh
docker buildx create --name container --driver=docker-container
```

Build image:

```sh
BUILD_DOCKER_BUILDER=container ./build.sh
```

## Security

This image is **NOT SECURE** because VNC is not a secure protocol. **DO NOT** use this image directly over the Internet. Wrap the traffic in tunnel.

## LICENSE

[MIT](https://github.com/ifrstr/docker-wine/blob/master/LICENSE)
