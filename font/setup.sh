#!/bin/bash

sudo apt-get install python-fontforge
tar -jxf ./ubuntu-font-family.tar.bz2
~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher ./ubuntu-font-family/UbuntuMono-R.ttf
mkdir ~/.fonts
mv ./UbuntuMono-R-Powerline.ttf ~/.fonts/
fc-cache -vf ~/.fonts
