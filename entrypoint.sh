#!/bin/bash
# shellcheck disable=SC2016
set -euo pipefail
IFS=$'\n\t'

function defaults {
    : "${DEVPISERVER_SERVERDIR=/data/server}"
    : "${DEVPI_CLIENTDIR=/data/client}"

    echo "ENTRYPOINT: DEVPISERVER_SERVERDIR is ${DEVPISERVER_SERVERDIR}"
    echo "ENTRYPOINT: DEVPI_CLIENTDIR is ${DEVPI_CLIENTDIR}"

    export DEVPISERVER_SERVERDIR DEVPI_CLIENTDIR
}

function generate_password() {
    # We disable exit on error because we close the pipe
    # when we have enough characters, which results in a
    # non-zero exit status
    set +e
    tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1 | tr -cd '[:alnum:]'
    set -e
}

function kill_devpi() {
    _PID=$(pgrep devpi-server)
    echo "ENTRYPOINT: Sending SIGTERM to PID $_PID"
    kill -SIGTERM "$_PID"
}

if [ "${1:-}" == "bash" ]; then
    exec "$@"
fi

defaults

DEVPI_PASSWORD="${DEVPI_PASSWORD:-}"
if [ -f "$DEVPISERVER_SERVERDIR/.root_password" ]; then
    DEVPI_PASSWORD=$(cat "$DEVPISERVER_SERVERDIR/.root_password")
elif [ -z "$DEVPI_PASSWORD" ]; then
    DEVPI_PASSWORD=$(generate_password)
fi

initialize=no
if [ ! -f "$DEVPISERVER_SERVERDIR/.serverversion" ]; then
    initialize=yes
    echo "ENTRYPOINT: Initializing server root $DEVPISERVER_SERVERDIR"
    devpi-init --serverdir "$DEVPISERVER_SERVERDIR"
fi

echo "ENTRYPOINT: Starting devpi-server"
devpi-server --host 0.0.0.0 --port 3141 --serverdir "$DEVPISERVER_SERVERDIR" "$@" &

timeout 10 bash -c 'until printf "" 2>>/dev/null >>/dev/tcp/$0/$1; do sleep 1; done' localhost 3141

echo "ENTRYPOINT: Installing signal traps"
trap kill_devpi SIGINT SIGTERM

if [ "$initialize" == "yes" ]; then
    echo "ENTRYPOINT: Initializing devpi-server"
    devpi use http://localhost:3141
    devpi login root --password=''
    echo "ENTRYPOINT: Setting root password to $DEVPI_PASSWORD"
    devpi user -m root "password=$DEVPI_PASSWORD"
    echo -n "$DEVPI_PASSWORD" > "$DEVPISERVER_SERVERDIR/.root_password"
    devpi index -y -c public pypi_whitelist='*'
    devpi logoff
fi

echo "ENTRYPOINT: Watching devpi-server"
PID=$(pgrep devpi-server)

if [ -z "$PID" ]; then
    echo "ENTRYPOINT: Could not determine PID of devpi-server!"
    exit 1
fi

set +e

while : ; do
    kill -0 "$PID" > /dev/null 2>&1 || break
    sleep 2s
done

echo "ENTRYPOINT: devpi-server died, exiting..."
