#!/usr/bin/env bash
set -euo pipefail
bash -n "$(command -v "$0")"
shopt -s nullglob
set -x

# TODO: commands to build kernel

env -C ./ebpf/cgroup-skb-egress-ringbuf ./build.sh
vng --verbose --cpus 2 -r kernel/linux/arch/x86/boot/bzImage -- env -C ./ebpf/cgroup-skb-egress-ringbuf ./test.sh
