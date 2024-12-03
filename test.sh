#!/usr/bin/env bash
set -euo pipefail
bash -n "$(command -v "$0")"
shopt -s nullglob
set -x

# To be run in the docker container for reproducibility!

# Use LLVM because gcc version of trixie not supported by v5.15 kernels.
cd linux && vng --build LLVM=1

# TODO
