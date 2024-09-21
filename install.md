# Install on Arch Linux

# Configure Ethernet
systemd-networkd.service
Config files at /etc/systemd/network
Can be accessed with systemctl, required for dhcp to work,


# Connect to wifi
To scan:
`iwctl station wlan0 get-networks`
`iwctl station wlan0 connect "SSID"`

Autostart:
`sudo systemctl enable iwd`

# Terminal
Install alacritty
`sudo pacman -S alacritty`
`mkdir -p ~/.config/alacritty/themes`
`git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes`

Put my yaml-file in ~.

# Shell
See script under zsh.
Then set shell with `chsh -s /usr/bin/zsh`.

# i3wm
1. Set exec i3wm in .xinitrc
2. Set font in ~/.config/i3/config (fixes boxes displayed as font)
3. `sudo pacman -S dmenu`

# Keyboard Layout
To check status: `localectl status`. Maybe edit `/etc/locale.conf` to `LANG=en_US.utf8`.

1. `localectl set-x11-keymap us default intl`
2. `setxkbmap -layout us -variant altgr-intl -option nodeadkeys`


# Other packages
For `make` and others: `pacman -S base-devel`

For converting audio books:
`pip install audible-cli`
`git clone git@github.com:KrumpetPirate/AAXtoMP3.git`
Requirement for AAXtoMP3:
`sudo pacman -Sy bc`

# Tmux
Package manager installed with
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
