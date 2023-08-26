# docker-devpi

[![Lint Dockerfile](https://github.com/coatl-dev/docker-devpi/actions/workflows/main.yml/badge.svg)](https://github.com/coatl-dev/docker-devpi/actions/workflows/main.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/coatl-dev/docker-devpi/coatl.svg)](https://results.pre-commit.ci/latest/github/coatl-dev/docker-devpi/coatl)
![Docker Pulls](https://img.shields.io/docker/pulls/coatldev/devpi)

Docker image with `devpi-client`, `devpi-server` and `devpi-web` pre-installed
using [`python:3.11.5-slim`]. Successor to [`muccg/devpi`].

## Supported tags

- [`6.9.2`, `latest`] - Comes with `devpi-server` 6.9.2, `devpi-web` 4.2.1 and
  `devpi-client` 6.0.5.
- [`6.9.1`] - Comes with `devpi-server` 6.9.1, `devpi-web` 4.2.1 and
  `devpi-client` 6.0.5.
- [`6.9.0`] - Comes with `devpi-server` 6.9.0, `devpi-web` 4.2.0 and
  `devpi-client` 6.0.4.

[`6.9.2`, `latest`]: https://github.com/coatl-dev/docker-devpi/blob/6.9.2/Dockerfile
[`6.9.1`]: https://github.com/coatl-dev/docker-devpi/blob/6.9.1/Dockerfile
[`6.9.0`]: https://github.com/coatl-dev/docker-devpi/blob/6.9.0/Dockerfile
[`muccg/devpi`]: https://hub.docker.com/r/muccg/devpi
[`python:3.11.5-slim`]: https://github.com/docker-library/python/blob/81b6e5f0643965618d633cd6b811bf0879dee360/3.11/slim-bookworm/Dockerfile
