FROM python:3.11-slim

LABEL \
  maintainer="César Román <cesar@coatl.dev>" \
  repository="https://github.com/coatl-dev/docker-devpi" \
  vendor="coatl.dev"

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PIP_INDEX_URL https://pypi.python.org/simple
ENV PIP_NO_CACHE_DIR 1
ENV PIP_TRUSTED_HOST 127.0.0.1
ENV VIRTUAL_ENV /env

# Install missing packages
RUN set -eux; \
    \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update --quiet; \
    apt-get install --yes --no-install-recommends \
        procps \
    ; \
    rm -rf /var/lib/apt/lists/*

# Create devpi user
RUN set -eux; \
    \
    addgroup --system --gid 1000 devpi; \
    adduser --disabled-password --system --uid 1000 --home /data \
        --shell /sbin/nologin --gid 1000 devpi

# Copy requirements
COPY requirements /tmp/requirements/

# Install virtualenv
RUN set -eux; \
    \
    python -m pip install \
        --requirement /tmp/requirements/virtualenv.txt

# Create virtualenv
RUN set -eux; \
    \
    python -m virtualenv ${VIRTUAL_ENV}

# Prepend virtualenv to PATH
ENV PATH ${VIRTUAL_ENV}/bin:${PATH}

# Install devpi
RUN set -eux; \
    \
    python -m pip install \
        --requirement /tmp/requirements/devpi.txt

EXPOSE 3141
VOLUME /data

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER devpi
ENV HOME /data
WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
