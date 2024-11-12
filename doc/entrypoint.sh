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
java -cp /pklgen.jar org.pkl.doc.Main "${pos_args[@]}" $@