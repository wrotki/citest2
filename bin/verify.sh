#!/usr/bin/env bash

set -e
set -v
set -x

echo "Verifying kernel after Polyverse applied"

uname -a
file /boot/vmlinuz-$(uname -r)
