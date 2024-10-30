#!/bin/sh -l

mkdir -p "$2"
LD_LIBRARY_PATH=/usr/share/swift/usr/lib/swift/linux PATH=$PATH:/usr/share/swift/usr/bin/ /pkl-gen-swift "$1" -o "$2"