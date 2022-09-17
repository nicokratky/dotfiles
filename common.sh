#!/usr/bin/env bash

# exit immediately if a command exits with a non-zero exitcode
set -e
# treat unset variables as errors when subtituting
set -u

[[ ! -d $HOME/.config/base16-shell ]] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || true

[[ ! -d $HOME/.nvm ]] && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash || true

source $HOME/.nvm/nvm.sh
nvm install --lts

[[ ! -d $HOME/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true


ZSH_PATH=$(which zsh)
if ! grep $ZSH_PATH /etc/shells; then
    echo $ZSH_PATH | sudo tee -a /etc/shells
fi

if [ $SHELL != $ZSH_PATH ]; then
    sudo chsh -s $ZSH_PATH $(whoami)
fi

cp -va files/.{zshrc,gitconfig,tmux.conf} $HOME/

mkdir -p $HOME/.config/nvim
cp -va files/init.vim $HOME/.config/nvim/
