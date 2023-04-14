#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# exit on errors
set -e

# get pkgsite
git clone --recursive https://github.com/golang/pkgsite.git

# setup pkgsite and cosmetics
cd pkgsite
#./all.bash build_static #build static site, with cosmetic changes
go install ./cmd/pkgsite

# prep for startup later
chmod 755 ./*
