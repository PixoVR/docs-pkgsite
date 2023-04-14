#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

PKGSITE_SOURCE="$1"
PKGSITE_PORT="${2:-3001}"
PKGSITE_HOST="${3:-localhost}"

# Start nginx
echo "Starting nginx..."
nginx -g 'daemon off;' &

# Start pkgsite
./start_pkgsite.sh "$PKGSITE_SOURCE" "$PKGSITE_PORT" "$PKGSITE_HOST" &

# Curl a package that has to be fetched remotely
sleep 10
echo "Curl: " $PKGSITE_HOST:$PKGSITE_PORT/builtin
curl $PKGSITE_HOST:$PKGSITE_PORT/builtin

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


