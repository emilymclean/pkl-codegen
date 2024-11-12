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

mkdir -p "$output_folder"
{{ .Env.call }} "${pos_args[@]}" $@