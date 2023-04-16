#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

#set -e

# change to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Move gopath stuff to a writable place
# this has to happen in the actual instance running,
# because /tmp is ephemeral and writable, but empty
# when the instance is created.  We need a writable
# space on $GOPATH for pkgsite to dynamically download
# documentation packages as needed. 
GOPATH=/tmp/go
PATH=$GOPATH/bin:$PATH
cp -rfv /go /tmp/

# Start nginx
echo "Starting Nginx ... "
nginx -g 'daemon off;' &

# Start pkgsite
./start_pkgsite.sh #&	# no fork...?

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?

