# Useful hotkeys

- Mod+R     Resize mode
- Mod+Shift+<arrow>     Move window

- Mod+Shift+<number>    Move window to workspace <number>
- Mod+<number>          Move to workspace


# Installation notes
For Multimedia keys to work, the program `playerctl` is needed.

For custom status bar: https://raw.githubusercontent.com/i3/i3status/main/contrib/any_position_wrapper.sh

# Installation on Debian
Using the window manager X11.

bash
```
sudo apt install xinit
echo "exec i3" > ~/.xinitrc
sudo startx # To start i3wm manually
```


# Default shell
`sudo chsh filip -s /usr/bin/zsh`

