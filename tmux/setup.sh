#!/bin/bash

P=`readlink -f $(dirname $0)`

ln -f -s $P/_tmux.conf ~/.tmux.conf
ln -f -s $P/tmux-powerline/_tmux-powerlinerc ~/.tmux-powerlinerc

# patch fonts
bash $P/tmux-powerline/fonts/setup.sh
