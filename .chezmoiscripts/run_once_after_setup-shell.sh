#!/bin/bash

echo ">> Setting up shell"

ZSH_PATH=$(which zsh)

if ! grep $ZSH_PATH /etc/shells; then
    echo $ZSH_PATH | sudo tee -a /etc/shells
fi

if [ $SHELL != $ZSH_PATH ]; then
    sudo chsh -s $ZSH_PATH $(whoami)
fi

echo ">> Done setting up shell"
