#!/bin/sh -l

mkdir -p "$2"
java -cp /pklgen.jar org.pkl.codegen.kotlin.Main "$1" -o "$2"