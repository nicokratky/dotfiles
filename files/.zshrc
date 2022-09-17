export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE=true
ENABLE_CORRECTION=true
COMPLETION_WAITING_DOTS=true

HIST_STAMPS="yyyy-mm-dd"

plugins=(
    colored-man-pages
    docker
    docker-compose
    git
    git-extras
    sudo

    # must be last
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE

export LANG="en_US.UTF-8"
export LC_ALL=$LANG

export EDITOR=nvim
export GIT_EDITOR=$EDITOR

export GPG_TTY=$(tty)

if [ -z "$SSH_CLIENT" ]; then
    export BASE16_SHELL="$HOME/.config/base16-shell/"
    [ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"
fi

# Setup nvm
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh

unsetopt correct_all

alias c="clear"
alias claer="clear"
alias vim="nvim"

alias gc="git commit --verbose --signoff"

alias sudo="sudo "
alias weather="curl wttr.in"

source $HOME/.zshrc-platform

__update_log() {
    printf "\n 📦 \e[92mUpdating $1\e[0m\n"
}

update() {
    __update_log 'platform'
    update_platform

    __update_log 'oh-my-zsh'
    omz update
}
