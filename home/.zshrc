# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# My custom theme picker for vim and possibly more
export BACKGROUND="dark"
export DEFAULT_USER="filip"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="filipwe" # set by `omz`

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-prompt virtualenv)

source $ZSH/oh-my-zsh.sh

# Setting env-vars
source ~/.zshenv

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/filip/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="H:M:S"

COMPLETION_WAITING_DOTS="true"

# Created by `pipx` on 2024-02-12 21:01:23
export PATH="$PATH:/home/filip/.local/bin"
