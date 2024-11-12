#!/bin/sh

formatted_args=("${@:1:$#-1}")
formatted_args+=("-o" "${!#}")

mkdir -p "${!#}"
{{ .Env.call }} "${formatted_args[@]}"