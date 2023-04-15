#!/bin/bash


echo pkgsite: `which pkgsite`
echo go: `which go`
echo "============"
ls -alR /tmp
la -slR /go/bin
echo "============"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

echo Starting pkgsite: $PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE

# modify the vars in static/shared/header/header.css,
# for instance, to change the style.  This will only
# work with -dev flag below.  This is done in setup_pkgsite.sh

cd $SOURCE
pkgsite \
	-http $PKGSITE_HOST:$PKGSITE_PORT \
	-static $DIR/static \
	`#-cache` \
	-proxy \
	-dev \
	`#-gorepo $GOROOT` \
	"$PKGSITE_SOURCE"
