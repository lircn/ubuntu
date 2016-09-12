#!/bin/bash

P=`readlink -f $(dirname $0)`

ln -f -s $P/_tmux.conf $HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
