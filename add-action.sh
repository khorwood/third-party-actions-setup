#!/bin/bash
if [ -z "$1" ]; then
    echo "Missing action argument"
    exit 1
fi
if [ -z "$2" ]; then
    echo "Missing version tag argument"
    exit 1
fi

set -e
git switch -c add_${1/\//_}_$2
git submodule add -f https://github.com/$1 $1/$2
pushd $1/$2
git checkout $2
popd
git config -f .gitmodules submodule.$1/$2.branch $2
git add .
git commit -m "Adding action $1/$2"
git push

echo "Pushed branch add_action_${1/\//_}_$2, please open a pull request."
