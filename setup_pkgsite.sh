#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# exit on errors
set -e

#setup pkgsite
git clone https://github.com/golang/pkgsite.git
cd pkgsite
go install ./cmd/pkgsite
go version

echo "link pkgsite executable..."

echo "other change..."
