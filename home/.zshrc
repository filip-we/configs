# Setting env-vars
source ~/.zshenv


# Oh-my-zsh
plugins=(git-prompt virtualenv)
source $ZSH/oh-my-zsh.sh


# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt beep extendedglob nomatch notify
bindkey -v
COMPLETION_WAITING_DOTS="true"
# Timestamp format for command history file
HIST_STAMPS="H:M:S"


# compinstall - command line completion
zstyle :compinstall filename '/home/filip/.zshrc'
autoload -Uz compinit
# Hack to only regenerate the completion dump file if it is older than 24 hours
# https://gist.github.com/ctechols/ca1035271ad134841284
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
    compinit;
else
    compinit -C;
fi;
