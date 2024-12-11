#!/usr/bin/env bash

set -euo pipefail
set -x

sudo mkdir -p /sys/fs/cgroup/aya-book-cgroup-skb-egress
sudo RUST_LOG=info ./target/debug/cgroup-skb-egress
