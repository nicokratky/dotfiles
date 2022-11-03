#!/bin/bash

echo ">> Setting up Neovim"

nvim --headless +PlugInstall +qa

echo ">> Done setting up Neovim"
