#!/bin/bash

P=`readlink -f $(dirname $0)`

#sodu apt-get install zsh
#sodu apt-get install autojump
#chsh -s /bin/zsh

if [[ ! -d ~/.oh-my-zsh ]]; then
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
fi

ln -f -s $P/lir.zsh-theme ~/.oh-my-zsh/themes/lir.zsh-theme
ln -f -s $P/lir.zsh ~/.oh-my-zsh/custom/lir.zsh
ln -f -s $P/_zshrc ~/.zshrc
