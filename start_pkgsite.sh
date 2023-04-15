#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# path to root of repository to serve docs for
#SOURCE="${1:-$DIR}"
#PORT="${2:-3000}"	# default to 3000 if none present
#HOST="${3:-}"		# default to empty

#SOURCE=`realpath $SOURCE`

echo Starting pkgsite: $PKGSITE_HOST:$PKGSITE_PORT for $PKGSITE_SOURCE
#echo "gorepo: $GOROOT/src"

# modify the vars in static/shared/header/header.css,
# for instance, to change the style.  This will only
# work with -dev flag below.

export GOPROXY=`go env GOPROXY`
#go env
#env

cd $SOURCE
pkgsite \
	-http $PKGSITE_HOST:$PKGSITE_PORT \
	-static $DIR/static \
	`#-cache` \
	-proxy \
	-dev \
	`#-gorepo $GOROOT` \
	"$PKGSITE_SOURCE"
