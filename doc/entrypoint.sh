#!/bin/sh

mkdir -p "$2"
java -cp /pklgen.jar org.pkl.doc.Main "$1" -o "$2"