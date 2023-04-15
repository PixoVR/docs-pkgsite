#!/bin/bash

source /root/.bashrc

echo pkgsite: `which pkgsite`
echo "============"
env
echo "============"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

echo Starting pkgsite: $PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE
#echo "gorepo: $GOROOT/src"

# modify the vars in static/shared/header/header.css,
# for instance, to change the style.  This will only
# work with -dev flag below.

cd $SOURCE
pkgsite \
	-http $PKGSITE_HOST:$PKGSITE_PORT \
	-static $DIR/static \
	`#-cache` \
	-proxy \
	-dev \
	`#-gorepo $GOROOT` \
	"$PKGSITE_SOURCE"
