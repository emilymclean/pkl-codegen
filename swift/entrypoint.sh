#!/bin/bash

pos_args=()

while [[ $# -gt 0 ]] && [[ "$1" != -* ]]; do
  pos_args+=("$1")
  shift
done

while getopts ":o:" opt; do
  case "${opt}" in
    o)
        output_folder="$OPTARG"
        ;;
  esac
done

echo "Positional arguments before options: ${pos_args[@]}"
echo "Remaining arguments after options: $@"

mkdir -p "$output_folder"
LD_LIBRARY_PATH=/usr/share/swift/usr/lib/swift/linux PATH=$PATH:/usr/share/swift/usr/bin/ /pkl-gen-swift "${pos_args[@]}" $@