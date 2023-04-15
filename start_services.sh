#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

#set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

#source /root/.bashrc

# Move gopath stuff to a writable place
GOPATH=/tmp/
PATH=$GOPATH/bin:$PATH
cp -rfv /go /tmp/

# Start nginx
echo "Starting Nginx ... "
nginx -g 'daemon off;' &

# Start pkgsite
./start_pkgsite.sh &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


