#!/bin/sh -l

mkdir -p "/data/$2"
LD_LIBRARY_PATH=/usr/share/swift/usr/lib/swift/linux PATH=$PATH:/usr/share/swift/usr/bin/ /pkl-gen-swift "/data/$1" -o /data/$2