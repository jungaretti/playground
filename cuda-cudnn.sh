#!/bin/bash

TEMPDIR="$(mktemp -d)"
pushd "$TEMPDIR"

# Install cuDNN
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
sudo apt install ./libcudnn8_8.1.0.77-1+cuda11.2_amd64.deb
