#!/usr/bin/env bash

set -e
set -v
set -x

sudo yum update -y && sudo yum upgrade -y

yum reinstall -y \*

curl https://repo.polyverse.io/install.sh | sh -s czcw7pjshny8lzzog8bgiizfr mborsa@polyverse.io

yum reinstall -y \*
