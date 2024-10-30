#!/bin/sh -l

mkdir -p "/data/$2"
java -cp /pklgen.jar org.pkl.codegen.java.Main "/data/$1" -o "/data/$2"