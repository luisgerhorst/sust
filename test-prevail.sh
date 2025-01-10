#!/usr/bin/env bash
set -euo pipefail
bash -n "$(command -v "$0")"
shopt -s nullglob
set -x

make -C KernJC/db/pocs/cve-2017-16995/bpf-obj
if ./ebpf-verifier/check KernJC/db/pocs/cve-2017-16995/bpf-obj/poc.bpf.o
then
    echo "error: unexpected pass"
fi
./ebpf-verifier/check KernJC/db/pocs/cve-2017-16995/bpf-obj/poc-pass.bpf.o
