#!/bin/bash

# bashrc
echo -n "Backup your original bashrc? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -f ~/.bashrc_backup; mv -f ~/.bashrc ~/.bashrc_backup
fi
ln -f -s $PWD/_bashrc ~/.bashrc
echo "=== DONE! ==="

# scripts
ln -f -s $PWD/scripts ~/scripts

# vim
bash $PWD/vim/setup.sh

# tmux & powerline
bash $PWD/tmux/setup.sh

# bin
ln -f -s $PWD/bin ~/bin

ln -f -s $PWD/_gitconfig ~/.gitconfig

