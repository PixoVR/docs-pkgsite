#!/bin/bash

echo "BEFORE:"
env
source /root/.bashrc
echo +_+_+_+_+_+
echo "AFTER:"
env
echo +_+_+_+_+_+

echo pkgsite: `which pkgsite`
echo go: `which go`
echo "============"
env
echo "============"
ls -alR /tmp
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
