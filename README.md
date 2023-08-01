# docker-devpi

[![Lint Dockerfile](https://github.com/coatl-dev/docker-devpi/actions/workflows/main.yml/badge.svg)](https://github.com/coatl-dev/docker-devpi/actions/workflows/main.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/coatl-dev/docker-devpi/coatl.svg)](https://results.pre-commit.ci/latest/github/coatl-dev/docker-devpi/coatl)
![Docker Pulls](https://img.shields.io/docker/pulls/coatldev/devpi)

Docker image with `devpi-client`, `devpi-server` and `devpi-web` pre-installed
using [`python:3.11.4-slim`]. Successor to [`muccg/devpi`].

## Supported tags

- [`6.9.1`, `latest`] - Comes with `devpi-server` 6.9.1, `devpi-web` 4.2.1 and
  `devpi-client` 6.0.5.
- [`6.9.0`] - Comes with `devpi-server` 6.9.0, `devpi-web` 4.2.0 and
  `devpi-client` 6.0.4.

[`6.9.1`, `latest`]: https://github.com/coatl-dev/docker-devpi/blob/6.9.1/Dockerfile
[`6.9.0`]: https://github.com/coatl-dev/docker-devpi/blob/v6.9.0/Dockerfile
[`muccg/devpi`]: https://hub.docker.com/r/muccg/devpi
[`python:3.11.4-slim`]: https://github.com/docker-library/python/blob/b744d9708a2fb8e2295198ef146341c415e9bc28/3.11/slim-bullseye/Dockerfile
