# docker-devpi

[![self-test](https://github.com/coatl-dev/docker-devpi/actions/workflows/self-test.yml/badge.svg)](https://github.com/coatl-dev/docker-devpi/actions/workflows/self-test.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/coatl-dev/docker-devpi/coatl.svg)](https://results.pre-commit.ci/latest/github/coatl-dev/docker-devpi/coatl)
[![Docker Repository on Docker Hub](https://img.shields.io/badge/hub.docker.com-white?logo=docker "Docker Repository on Docker Hub")](https://hub.docker.com/r/coatldev/devpi)
[![Docker Repository on Quay](https://img.shields.io/badge/quay.io-red?logo=red-hat "Docker Repository on Quay")](https://quay.io/repository/coatldev/devpi)

Docker image with `devpi-client`, `devpi-server` and `devpi-web` pre-installed
using [`python:3.12-slim`].

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

[`python:3.12-slim`]: https://github.com/docker-library/python/blob/HEAD/3.12/slim-bookworm/Dockerfile
