#!/bin/sh

SERVICE=server
if [ -n "$1" ] && [ "$1" != "--" ]; then
    SERVICE="$1"
    shift
fi

if [ "$1" = "--" ]; then
    shift
fi

set -xe

case $SERVICE in
  server)
    java --add-opens java.base/java.util=ALL-UNNAMED -jar ./leshan-server-demo.jar "$@" ;;
  bootstrap|bsserver)
    java --add-opens java.base/java.util=ALL-UNNAMED -jar ./leshan-bsserver-demo.jar "$@" ;;
  *)
    echo "Usage: <server|bootstrap>"
    exit 1
esac

