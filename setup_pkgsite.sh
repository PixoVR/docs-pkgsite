#!/bin/bash

# exit on errors
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# could install this way, but we want access to
# the static folder to change the style.
#go install golang.org/x/pkgsite/cmd/pkgsite@master

# get pkgsite
git clone --recursive https://github.com/golang/pkgsite.git

# install pkgsite
cd pkgsite
go install ./cmd/pkgsite

echo pkgsite: `which pkgsite`
#pkgsite -help	# should basically produce an error message

# setup style
#./all.bash build_static #build static site, with cosmetic changes
#mv /documentation/docs-pkgsite/
#cp -r xxxxx

# prep for startup later
chmod 755 $DIR/*.sh
