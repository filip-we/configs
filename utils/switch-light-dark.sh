#!/bin/bash


if [[ "$1" == "dark" ]]; then
    sed -i 's/papercolor_light/papercolor_dark/' ~/.alacritty.yml
    export BACKGROUND=dark

elif [[ "$1" == "light" ]]; then
    sed -i 's/papercolor_dark/papercolor_light/' ~/.alacritty.yml
    export BACKGROUND=light

else
    echo "Command not recognized"
    exit 1
fi
