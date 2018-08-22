#!/usr/bin/env bash

set -e
set -v
set -x

sudo yum update -y && sudo yum upgrade -y

echo "Reinstalling before Polyverse"
yum reinstall -y \*

echo "Installing Polyverse"
bash -c "curl https://repo.polyverse.io/install.sh | sh -s czcw7pjshny8lzzog8bgiizfr mborsa@polyverse.io"
echo "Installed Polyverse"

echo "Reinstalling after Polyverse"
yum reinstall -y \*
echo "Reinstalling after Polyverse completed"
