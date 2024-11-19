#!/bin/bash
set -ex

if [ "$(uname -m)" == "x86_64" ]; then
  ARCH="amd64"
else
  ARCH="aarch64"
fi
echo "ARCH=$ARCH"

curl -L -o /pkl https://github.com/apple/pkl/releases/download/{{{ env.pkl_version }}}/pkl-linux-$ARCH
chmod +x /pkl
mv /pkl /usr/local/bin/pkl