#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

#set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

source /root/.bashrc

#echo "--0--"
#env
#echo "--1--"
#which go
#echo "--2--"
#go env
#echo "--3--"

# Start nginx
echo "Starting Nginx ... "
nginx -g 'daemon off;' &

# Start pkgsite
./start_pkgsite.sh "$PKGSITE_SOURCE" "$PKGSITE_PORT" "$PKGSITE_HOST" &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


