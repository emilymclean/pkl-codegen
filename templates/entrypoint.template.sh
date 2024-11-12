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

if [[ -z "$output_folder" ]] && [[ ${#pos_args[@]} -gt 0 ]]; then
  last_index=$((${#pos_args[@]} - 1))
  output_folder="${pos_args[$last_index]}"
  unset 'pos_args[$last_index]'
fi

named_args+=("-o" "$output_folder")

mkdir -p "$output_folder"

{{{ env.call }}} "${pos_args[@]}" "${named_args[@]}"