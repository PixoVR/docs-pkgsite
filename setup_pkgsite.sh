#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# exit on errors
set -e

# get pkgsite
git clone --recursive https://github.com/golang/pkgsite.git

# install pkgsite
cd pkgsite
go install ./cmd/pkgsite

# should basically produce an error message
echo pkgsite: `which pkgsite`
pkgsite -help

#go install golang.org/x/pkgsite/cmd/pkgsite@master

# setup style
#./all.bash build_static #build static site, with cosmetic changes
#mv /documentation/docs-pkgsite/
#cp -r xxxxx

# prep for startup later
chmod 755 ./*
