#!/bin/bash

# change to the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

#echo pkgsite: `which pkgsite`

# for style updates, check setup_pkgsite.sh

#echo "====="
#go env
#echo "====="

echo "++++++"
free
echo "++++++"
du -hs /*
echo "++++++"
df -h
echo "++++++"
mount
echo "++++++"

cd $SOURCE
pkgsite \
	-http $PKGSITE_HOST:$PKGSITE_PORT \
	-static $DIR/static \
	`#-cache` \
	-proxy \
	`#-dev` \
	`#-gorepo $GOROOT` \
	"$PKGSITE_SOURCE"
