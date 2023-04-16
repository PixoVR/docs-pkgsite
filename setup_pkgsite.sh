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

# To change style, modify the vars in static/shared/header/header.css,
# for instance, or in a template file (.tmpl).  Changes made will be
# built in to the executable here.

# To actually develop the style changes, you will need to use
# `go run cmd/pkgsite` and modify the contents of `static`. If your
# changes are only colors and css, use the `-dev` flag when called.
# to see changes to the .tmpl files, you will need to restart the
# run command above after running `./all.bash build_static`.
# once you're happy with your style changes, copy the static folder
# over the folder in the `docs-pkgsite` repository.


# copy in style from docs-pkgsite
#mv static static.old
#cp -r ../static ./

# build style
#./all.bash build_static #build static site, with cosmetic changes

# build and install
# go build ./cmd.pkgsite
go install ./cmd/pkgsite

echo pkgsite: `which pkgsite`
#pkgsite -help	# should basically produce an error message

# could delete pkgsite here to save space
#rm -r pkgsite

# prep for startup later
chmod 755 $DIR/*.sh
