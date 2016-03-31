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
ln -f -s $PWD/scripts ~/

# vim
bash $PWD/vim/setup.sh

# bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# tmux & powerline
bash $PWD/tmux/setup.sh

ln -f -s $PWD/_gitconfig ~/.gitconfig

#git
git config --global i18n.commitencoding utf-8
git config --global core.editor vim
git config --global color.ui true
git config --global help.format html
