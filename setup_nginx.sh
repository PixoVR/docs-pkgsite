#!/bin/bash

set -e

# change to directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

if [[ -z "${PROJECT_URL}" ]]; then
	echo "PROJECT_URL must be set for setup_nginx.sh"
	exit 1
fi

echo Creating nginx.conf: $PROJECT_URL pkgconf: http://$PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE

# trim lead and tail spaces and slashes
PROJECT_URL=`echo $PROJECT_URL | perl -pe "s/[\s\/]*(.*)[\/\s]*/\1/"`

echo "PROJECT URL: $PROJECT_URL"
sed  -i "s=##PROJECT_URL##=$PROJECT_URL=" nginx.conf
sed  -i "s=##PKGSITE_HOST##=$PKGSITE_HOST=" nginx.conf
sed  -i "s=##PKGSITE_PORT##=$PKGSITE_PORT=" nginx.conf

cp nginx.conf /etc/nginx/nginx.conf


