if [[ "$(uname)" == "Linux" ]]; then
    export TERM="xterm-256color"
else
    # Pointing to the correct ctag (on Mac)
    alias ctag="/opt/homebrew/bin/ctags"
    export PICO_SDK_PATH=/home/filip/pico-sdk
fi

export EDITOR="vim"
export DEFAULT_USER="filip"

# My custom method to tell configs wether to use dark or light themes
export BACKGROUND="dark"

# ZSH
export ZSH_THEME="filipwe"
export ZSH="$HOME/.config/zsh/ohmyzsh"

