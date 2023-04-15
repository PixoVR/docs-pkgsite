#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source /root/.bashrc

echo "-----"
env
echo "-----"
which go
echo "-----"
go env
echo "-----"

# Start nginx
echo "Starting nginx..."
nginx -g 'daemon off;' &


# Start pkgsite
./start_pkgsite.sh "$PKGSITE_SOURCE" "$PKGSITE_PORT" "$PKGSITE_HOST" &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


