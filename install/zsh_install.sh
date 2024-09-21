#!/bin/bash
#sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://github.com/powerline/fonts/archive/refs/tags/2015-12-04.tar.gz
tar -xzvf fonts-2015-12-04.tar.gz
cd fonts-2015-12-04
sh install.sh
cd ..
