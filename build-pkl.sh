#!/bin/bash

create_action_pkl() {
    file_name="$(echo "$1" | sed 's#.*/\(.*\)@.*#\1#')"
    if [ -f .github/workflows/src/actions/${file_name}.pkl ]; then
        return
    fi

    pkl-github-actions-step-generator from-remote $1 -o .github/workflows/src/actions/$file_name.pkl \
        --pkl-github-actions-bindings --pkl-github-actions-bindings-version 0.1.0-alpha.96
}

create_action_pkl actions/checkout@v4
create_action_pkl emilymclean/template-render-action@v1.0.2

pkl eval .github/workflows/src/build.pkl -f yaml -o .github/workflows/build.yml
pkl eval .github/workflows/src/test.pkl -f yaml -o .github/workflows/test.yml
pkl eval .github/workflows/src/pkl-update.pkl -f yaml -o .github/workflows/pkl-update.yml
pkl eval .github/workflows/src/swift-tool-update.pkl -f yaml -o .github/workflows/swift-tool-update.yml
pkl eval .github/workflows/src/go-tool-update.pkl -f yaml -o .github/workflows/go-tool-update.yml