#!/bin/bash

P=`readlink -f $(dirname $0)`

ln -f -s $P/_tmux.conf ~/.tmux.conf
