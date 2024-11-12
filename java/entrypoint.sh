#!/bin/bash

formatted_args=("${@:1:$#-1}")
formatted_args+=("-o" "${!#}")

mkdir -p "${!#}"
java -cp /pklgen.jar org.pkl.codegen.java.Main "${formatted_args[@]}"