#!/usr/bin/env bash

set -euo pipefail
set -x

rm -f target/debug/cgroup-skb-egress
RUST_LOG=info cargo xtask run
