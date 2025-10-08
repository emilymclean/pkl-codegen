#!/bin/bash
set -e

PATH="$PATH:$(go env GOPATH)/bin" pkl-gen-go "$@"