#!/bin/bash

# change to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# for style updates, check setup_pkgsite.sh

#echo "====="
#env
#echo "====="
#go env
echo "++++++"
free
echo "++++++"
#du -hs /*
#echo "++++++"
#df -h
#echo "++++++"
mount
echo "++++++"
#ls -al /
#echo "@@@@@@"
cat /proc/cpuinfo
echo "@@@@@@"

if [[ -z "${PKGSITE_PORT}" ]]; then
	echo "PKGSITE_PORT must be set for start_pkgsite.sh"
	exit 1
fi

# set to empty string, which means listen to any request
PKGSITE_HOST=

cd $SOURCE
pkgsite \
	-http $PKGSITE_HOST:$PKGSITE_PORT \
	-static $DIR/static \
	`#-cache` \
	`#-proxy` \
	`#-dev` \
	`#-gorepo $GOROOT` \
	"$PKGSITE_SOURCE"

