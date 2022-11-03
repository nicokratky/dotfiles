#!/bin/bash

set -eufo pipefail

echo ">> Setting up nvm"

if [[ ! -d $HOME/.nvm ]]; then
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash
else
    echo "nvm already installed, skipping..."
fi

source $HOME/.nvm/nvm.sh

echo "Installing LTS"
nvm install --lts

echo ">> Done setting up nvm"
