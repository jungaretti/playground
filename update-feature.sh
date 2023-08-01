#!/bin/bash

set -e

git submodule update

pushd devcontainers-features
git checkout dotnet-install-script
popd

rsync -r devcontainers-features/src/dotnet/* .devcontainer/features/dotnet
