#!/bin/bash

GIT_PATH="$HOME/git"
mkdir -p $GIT_PATH

cd $GIT_PATH
echo -n "Download Powerline? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm ./powerline -rf
    git clone https://github.com/powerline/powerline.git
fi

mkdir -p $HOME/.fonts/
cp $GIT_PATH/powerline/font/PowerlineSymbols.otf $HOME/.fonts/
fc-cache -vf $HOME/.fonts/

mkdir -p  $HOME/.config/fontconfig/conf.d/
cp $GIT_PATH/powerline/font/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
