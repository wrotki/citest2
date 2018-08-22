#!/usr/bin/env bash

set -e
set -v
set -x

vagrant destroy --force

echo vagrant-aws instance cleanup complete
