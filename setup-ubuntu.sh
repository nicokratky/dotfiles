#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero exitcode
set -e
# treat unset variables as errors when subtituting
set -u

sudo apt update
sudo apt upgrade

PACKAGE_LIST=ubuntu-package-list.txt

cat $PACKAGE_LIST | xargs sudo apt install -y

[[ ! -d $HOME/.config/base16-shell ]] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || true

[[ ! -d $HOME/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
[[ ! -d $ZSH_CUSTOM/themes/spaceship-prompt ]] && git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt || true
ln -sf $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme

ZSH_PATH=$(which zsh)
if ! grep $ZSH_PATH /etc/shells; then
    echo $ZSH_PATH | sudo tee -a /etc/shells
fi

if [ $SHELL != $ZSH_PATH ]; then
    sudo chsh -s $ZSH_PATH $(whoami)
fi

cp -va files/.{zshrc,tmux.conf} $HOME/

mkdir -p $HOME/.config/nvim
cp -va files/init.vim $HOME/.config/nvim/
