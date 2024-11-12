#!/bin/bash

pos_args=()
named_args=()
output_folder=""

while [[ $# -gt 0 ]]; do
  if [[ "$1" == -* ]]; then
    case "$1" in
        -o)
            shift
            output_folder="$1"
            shift
            ;;
        *)
            named_args+=("$1" "$2")
            shift; shift
            ;;
    esac
  else
    pos_args+=("$1")    
    shift
  fi
done

if [[ -z "$output_folder" ]] && [[ ${#args[@]} -gt 0 ]]; then
  output_folder="${pos_args[-1]}"
fi

named_args+=("-o" "$output_folder")

mkdir -p "$output_folder"

java -cp /pklgen.jar org.pkl.codegen.java.Main "${pos_args[@]}" "${named_args[@]}"