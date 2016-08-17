#!/bin/bash

GIT_PATH="~/git/"
mkdir -p $GIT_PATH

cd $GIT_PATH
rm ./powerline -rf
git clone https://github.com/powerline/powerline.git

mkdir -p ~/.fonts/
cp $GIT_PATH/powerline/font/PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/

mkdir -p  ~/.config/fontconfig/conf.d/
cp $GIT_PATH/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
