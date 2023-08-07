#!/bin/bash

set -e

UPDATE_PARAM=''
if [ "$1" == "--update" ]; then
    echo "Updating submodules"
    UPDATE_PARAM='--remote'
fi

git submodule update --init --recursive $UPDATE_PARAM

pushd devcontainers-features
git checkout dotnet-install-script
popd

rsync -r devcontainers-features/src/dotnet/* .devcontainer/features/dotnet
