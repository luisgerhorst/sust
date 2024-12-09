#!/usr/bin/env bash
set -euo pipefail
bash -n "$(command -v "$0")"
shopt -s nullglob
set -x

docker build -t $1 \
    --build-arg USER=$USER --build-arg UID=$(id -u $USER) \
    --build-arg HOME=$HOME \
    .
