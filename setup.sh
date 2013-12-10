#!/bin/bash

P=`readlink -f $(dirname $0)`

rm -rf ~/.vim/colors
ln -sd $P/vim/colors ~/.vim/colors

rm -rf ~/.vim/bundle/snipMate/snippets
ln -sd $P/vim/snippets ~/.vim/bundle/snipMate/snippets

rm -rf ~/bin
ln -sd $P/bin ~/bin

rm -f ~/.vimrc
ln -s $P/vim/_vimrc ~/.vimrc

echo "=== DONE! ==="

# setup dictionary
echo -n "Setup dictionary? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    sudo sh -c "apt-get install stardict"
    sudo sh -c "apt-get install sdcv"
    wget -O stardict-langdao-ec-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/dqqa5goulgt3wp9/stardict-langdao-ec-gb-2.4.2.tar.gz?token_hash=AAHQ5XX-mCgpgSN67CZAtM8lESnRF2MderYw67Quo77XLA&dl=1 & wait
    wget -O stardict-langdao-ce-gb-2.4.2.tar.gz https://dl.dropboxusercontent.com/s/rc4g62xevaickig/stardict-langdao-ce-gb-2.4.2.tar.bz2?token_hash=AAE-LJ3a1irBxgcltV9upxWvQGeocJJ_ik9RYqotrTmPGQ&dl=1 & wait
    tar -xf $P/dict/stardict-langdao-ec-gb-2.4.2.tar.gz
    tar -xf $P/dict/stardict-langdao-ce-gb-2.4.2.tar.gz
    rm stardict-langdao-ec-gb-2.4.2.tar.gz
    rm stardict-langdao-ce-gb-2.4.2.tar.gz
    sudo sh -c "mv -u ./stardict-langdao-* /usr/share/stardict/dic/"
    echo "=== DONE! ==="
fi

exit 0
