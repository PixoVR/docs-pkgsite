#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

#set -e

# make sure all these temp dirs exist, since that is our writable space
#mkdir -pv $GOPATH $GOCACHE $GOENV $GOTMPDIR

# change to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# get env set up
source /env2.sh

# use what's already cached!
#GOPROXY=file://$(go env GOMODCACHE)/cache/download
#go env -w GOPROXY=https://proxy.golang.org,file://$(go env GOMODCACHE)/cache/download,direct

# Start pkgsite
echo Starting pkgsite: $PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE
./start_pkgsite.sh &

# Wait a moment for pkgsite to listen
sleep 90

# Start nginx
echo Starting nginx for $PROJECT_URL
nginx -g 'daemon off;' &

# Wait a moment for nginx
sleep 5

# pull an external library during build, so it's cached
#echo "Pulling $PROJECT_URL/builtin"
	#curl "http://localhost:3000/$PROJECT_URL/" 2>&1 > /dev/null
#curl "http://localhost:3000/$PROJECT_URL/builtin#string" &>/dev/null
	#curl "http://localhost:3001/builtin#string"

# Wait for any process to exit
wait -n

# Wait for pkgsite to exit
#wait $!

# if we get this far, it's because something has failed above
# so therefore we return false
echo "Services exiting." && false
  
# Exit with status of process that exited first
exit $?

