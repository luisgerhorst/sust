#!/usr/bin/env bash
set -euo pipefail
bash -n "$(command -v "$0")"
shopt -s nullglob
set -x

test "$(rustc --version)" == "rustc 1.83.0 (90b35a623 2024-11-26)"
env -C ./ebpf/cgroup-skb-egress-ringbuf ./build.sh
vng --verbose --cpus 2 -r kernel/linux/arch/x86/boot/bzImage -- env -C ./ebpf/cgroup-skb-egress-ringbuf ./test.sh
