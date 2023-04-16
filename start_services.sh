#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

#set -e

# make sure all these temp dirs exist, since that is our writable space
mkdir -pv $GOPATH $GOCACHE $GOENV $GOTMPDIR

# change to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# get env set up
source /env2.sh

# use what's already cached!
#GOPROXY=file://$(go env GOMODCACHE)/cache/download

# Move gopath stuff to a writable place
# this has to happen in the actual instance running,
# because /tmp is ephemeral and writable, but empty
# when the instance is created.  We need a writable
# space on $GOPATH for pkgsite to dynamically download
# documentation packages as needed. 
#cp -r /go $GOPATH
#cp -r /root/.cache/go-build $GOCACHE
#cp -r /.config /tmp/.config
#chmod -R 777 /tmp/go

# Start nginx
echo Starting nginx for $PROJECT_URL
nginx -g 'daemon off;' &

# Start pkgsite
echo Starting pkgsite: $PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE
#./start_pkgsite.sh 2>&1 #&	# no fork...?
./start_pkgsite.sh &

# pull an external library during build, so it's cached
sleep 60
#curl "http://localhost:3000/$PROJECT_URL/" 2>&1 > /dev/null
#curl "http://localhost:3000/$PROJECT_URL/builtin#string" 2>&1 > /dev/null
curl "http://localhost:3000/$PROJECT_URL/builtin#string"

# Wait for any process to exit
wait -n

# Wait for pkgsite to exit
#wait $!

echo "Services exiting."
  
# Exit with status of process that exited first
exit $?

