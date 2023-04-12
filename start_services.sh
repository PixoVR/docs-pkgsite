#!/bin/bash

# referenced from
# https://docs.docker.com/config/containers/multi-service_container/

set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

PKGSITE_SOURCE="$1"
PKGSITE_PORT="${2:-3001}"
PKGSITE_HOST="${3:-}"

# this variable is referenced in nginx.conf
eval "$(cat ../env.sh | grep "PROJECT_URL")"

#echo "PROJECT URL: $PROJECT_URL"
sed  -i "s=##PROJECT_URL##=$PROJECT_URL=" /etc/nginx/nginx.conf
sed  -i "s=##PKGSITE_HOST##=$PKGSITE_HOST=" /etc/nginx/nginx.conf
sed  -i "s=##PKGSITE_PORT##=$PKGSITE_PORT=" /etc/nginx/nginx.conf

# Start nginx
nginx -g 'daemon off;' &

# Start pkgsite
./start_pkgsite.sh "$PKGSITE_SOURCE" "$PKGSITE_PORT" "$PKGSITE_HOST"

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?


