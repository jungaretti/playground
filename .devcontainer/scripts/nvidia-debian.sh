#!/bin/bash

set -e

INSTALL_CUDA_LIBRARIES="false"
INSTALL_CUDNN="false"

ARGS=()
while [[ $# -gt 0 ]]; do
    case $1 in
    --cuda-libraries)
        INSTALL_CUDA_LIBRARIES="true"
        shift
        ;;
    --cudnn)
        INSTALL_CUDNN="true"
        shift
        ;;
    -* | --*)
        echo "Unknown option: $1"
        exit 1
        ;;
    *)
        ARGS+=("$1")
        shift
        ;;
    esac
done

if [ "$(id -u)" -ne 0 ]; then
    echo "Must run as root"
    exit 1
fi

KEYRING_PACKAGE="cuda-keyring_1.0-1_all.deb"

UBUNTU_VERSION="$(lsb_release -sr | sed 's/\.//g')"
KEYRING_REPO="https://developer.download.nvidia.com/compute/cuda/repos/ubuntu$UBUNTU_VERSION/x86_64"
KEYRING_PACKAGE_URL="$KEYRING_REPO/$KEYRING_PACKAGE"

KEYRING_PACKAGE_PATH="$(mktemp -d)"
KEYRING_PACKAGE_FILE="$KEYRING_PACKAGE_PATH/$KEYRING_PACKAGE"

wget -O "$KEYRING_PACKAGE_FILE" "$KEYRING_PACKAGE_URL"
apt-get install -yq "$KEYRING_PACKAGE_FILE"
apt-get update -yq

if [ "$INSTALL_CUDA_LIBRARIES" = "true" ]; then
    echo "Installing CUDA libraries..."
    apt-get install -yq cuda-libraries-11-7
fi

if [ "$INSTALL_CUDNN" = "true" ]; then
    echo "Installing cuDNN libraries..."
    apt-get install -yq libcudnn8
fi
