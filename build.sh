#!/bin/bash

SRC=$(realpath $(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd))

set -e

pushd $SRC &> /dev/null

# disable cgo
(set -x;
  GO111MODULE=on \
  CGO_ENABLED=0 \
  GOARCH=amd64 \
  GOOS=linux \
    go build -ldflags="-w -s" -a .
  docker buildx build --platform linux/amd64 --push -t robinbaeckman/drone-mattermost:latest --no-cache .
)

popd &> /dev/null
