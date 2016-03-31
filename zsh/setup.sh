#!/bin/bash

P=`readlink -f $(dirname $0)`

sodu apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s /bin/zsh
ln -f -s $P/lir.zsh-theme ~/.oh-my-zsh/themes/lir.zsh-theme
ln -f -s $P/_zshrc ~/.zshrc
