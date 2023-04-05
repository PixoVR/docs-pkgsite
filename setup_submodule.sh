#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

prefix() {
	cat - | perl -pe "s/^(.+)$/   \1/"
}

if [ -f "../.gitignore" ]; then
	echo "Skipping existing .gitignore..."
else
	echo "Copying .gitignore..."
	cp -v setup_template/.gitignore ../ | prefix
fi

if [ -f "../env.sh" ]; then
	echo "Skipping existing env.sh..."
else
	echo "Copying env.sh... You must modify/update this file for your implementation."
	cp -v setup_template/env.sh ../env.sh | prefix
fi

if [ -f "../Dockerfile" ]; then
	echo "Skipping existing Dockerfile..."
else
	echo "Copying Dockerfile..."
	cp -v Dockerfile ../ | prefix
fi

