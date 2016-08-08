#!/bin/bash

FONT_PATH="/tmp/vim_font/"
sudo apt-get install python-fontforge

mkdir $FONT_PATH
cd $FONT_PATH
git clone https://github.com/powerline/fonts
$FONT_PATH/fonts/install.sh

fc-cache -vf ~/.local/share/fonts/
