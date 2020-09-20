# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# Setup nvm
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

HYPHEN_INSENSITIVE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    colored-man-pages
    sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG="en_US.UTF-8"
export LC_ALL=$LANG

export EDITOR=nvim
export GIT_EDITOR=$EDITOR

export GPG_TTY=$(tty)

alias c="clear"
alias claer="clear"
alias vim="nvim"

__update_log() {
    printf "\n 📦 \e[92mUpdating $1\e[0m\n"
}

source $HOME/.zshrc-platform

update() {
    __update_log 'platform'
    update_platform

    __update_log 'oh-my-zsh'
    omz update
}
