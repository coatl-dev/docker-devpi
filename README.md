# docker-devpi

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/coatl-dev/docker-devpi/coatl.svg)](https://results.pre-commit.ci/latest/github/coatl-dev/docker-devpi/coatl)
![Docker Pulls](https://img.shields.io/docker/pulls/coatldev/devpi)
[![Docker Repository on Quay](https://quay.io/repository/coatldev/devpi/status "Docker Repository on Quay")](https://quay.io/repository/coatldev/devpi)

Docker image with `devpi-client`, `devpi-server` and `devpi-web` pre-installed
using [`python:3.12-slim`].

## Supported tags

For the full list of supported tags, [click here].

## How to use this image

To run locally:

### Docker Hub

```bash
docker run \
  --name devpi-server \
  --detach \
  --publish 3141:3141 \
  --volume devpi-data:/data
  --env DEVPI_PASSWORD=password \
  coatldev/devpi:latest
```

### Github Container Registry

```bash
docker run \
  --name devpi-server \
  --detach \
  --publish 3141:3141 \
  --volume devpi-data:/data
  --env DEVPI_PASSWORD=password \
  ghcr.io/coatl-dev/devpi:latest
```

### Quay

```bash
docker run \
  --name devpi-server \
  --detach \
  --publish 3141:3141 \
  --volume devpi-data:/data
  --env DEVPI_PASSWORD=password \
  quay.io/coatldev/devpi:latest
```

[click here]: https://hub.docker.com/repository/docker/coatldev/devpi/tags
[`python:3.12-slim`]: https://github.com/docker-library/python/blob/HEAD/3.12/slim-bookworm/Dockerfile
