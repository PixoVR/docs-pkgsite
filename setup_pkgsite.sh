#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# exit on errors
set -e

#setup pkgsite
git clone --recursive https://github.com/golang/pkgsite.git
cd pkgsite
#./all.bash build_static #build static site, with cosmetic changes
go install ./cmd/pkgsite

#echo "pkgsite version: `pkgsite -v`"	# version flag doesn't exist

# now call:
# ./start_pkgsite.sh path/to/go/library

