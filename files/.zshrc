# Base16 Shell
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$("$BASE16_SHELL/profile_helper.sh")"

# Setup nvm
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && source $NVM_DIR/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

unsetopt correct_all

plugins=(
    git
    git-extras
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

source $HOME/.zshrc-platform

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

__update_log() {
    printf "\n 📦 \e[92mUpdating $1\e[0m\n"
}

update() {
    __update_log 'platform'
    update_platform

    __update_log 'oh-my-zsh'
    omz update
}
