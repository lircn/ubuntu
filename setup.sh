#!/bin/bash

# bashrc
echo -n "Backup your original bashrc? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -f $HOME/.bashrc_backup; mv -f $HOME/.bashrc $HOME/.bashrc_backup
fi
ln -f -s $PWD/_bashrc $HOME/.bashrc
echo "=== DONE! ==="

# scripts
ln -f -s $PWD/scripts $HOME/

# powerline
bash $PWD/powerline/setup.sh

# vim
bash $PWD/vim/setup.sh

# bundle
echo -n "Download Vundle? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
fi

# tmux
bash $PWD/tmux/setup.sh

# git
ln -f -s $PWD/_gitconfig $HOME/.gitconfig
git config --global i18n.commitencoding utf-8
git config --global core.editor vim
git config --global color.ui true
git config --global help.format html

# ag
ln -f -s $PWD/agignore $HOME/.agignore
