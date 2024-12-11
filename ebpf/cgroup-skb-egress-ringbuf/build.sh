#!/usr/bin/env bash

set -euo pipefail
set -x

# rm -rfd target/debug/cgroup-skb-egress target/bpfel-unknown-none
RUST_LOG=info cargo xtask build-ebpf
cargo build
