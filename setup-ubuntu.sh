#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero exitcode
set -e
# treat unset variables as errors when subtituting
set -u

sudo apt update
sudo apt upgrade

PACKAGE_LIST=ubuntu-package-list.txt

cat $PACKAGE_LIST | xargs sudo apt install -y

source ./common.sh
cp -va files/.zshrc-platform-ubuntu $HOME/.zshrc-platform
