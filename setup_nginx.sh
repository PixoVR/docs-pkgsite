#!/bin/bash

set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

#PKGSITE_SOURCE="$1"
#PKGSITE_PORT="${2:-3001}"
#PKGSITE_HOST="${3:-}"

# this variable is referenced in nginx.conf
#eval "$(cat ../env.sh | grep "PROJECT_URL")"

echo Creating nginx.conf: $PROJECT_URL pkgconf: http://$PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE

# trim lead and tail spaces and slashes
PROJECT_URL=`echo $PROJECT_URL | perl -pe "s/[\s\/]*(.*)[\/\s]*/\1/"`

echo "PROJECT URL: $PROJECT_URL"
sed  -i "s=##PROJECT_URL##=$PROJECT_URL=" nginx.conf
sed  -i "s=##PKGSITE_HOST##=$PKGSITE_HOST=" nginx.conf
sed  -i "s=##PKGSITE_PORT##=$PKGSITE_PORT=" nginx.conf

cp nginx.conf /etc/nginx/nginx.conf


