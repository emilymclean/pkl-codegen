#!/bin/bash

PATH="$PATH:$(go env GOPATH)/bin" pkl-gen-go "$@"