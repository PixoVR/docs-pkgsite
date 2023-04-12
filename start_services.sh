#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

eval "$(cat ./documentation/env.sh | grep "PROJECT_URL")"

# Start nginx
nginx -g

# Start pkgsite
./start_pkgsite.sh "$1" "$2" "$3" &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


