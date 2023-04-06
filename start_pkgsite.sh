#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# path to root of repository to serve docs for
SOURCE="${1:-$PWD}"
PORT="${2:-3000}"	# default to 3000 if none present
HOST="${3:-localhost}"	# default to localhost

echo Starting pkgsite: $HOST:$PORT for $SOURCE

# modify the vars in static/shared/header/header.css,
# for instance, to change the style.  This will only
# work with -dev flag below.

cd $SOURCE
pkgsite \
	-http $HOST:$PORT \
	`#-static $DIR/static` \
	-dev \
	`#-gorepo /usr/local/go/src` \
	"$SOURCE"
