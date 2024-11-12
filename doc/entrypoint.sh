#!/bin/bash

formatted_args=("${@:1:$#-1}")
formatted_args+=("-o" "${!#}")

mkdir -p "${!#}"
java -cp /pklgen.jar org.pkl.doc.Main "${formatted_args[@]}"