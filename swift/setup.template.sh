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
mv pkl /usr/local/bin/pkl

curl -L https://github.com/apple/pkl-swift/releases/download/{{{ env.swift_tool_version }}}/pkl-gen-swift-linux-$ARCH.bin -o /pkl-gen-swift
chmod +x /pkl-gen-swift