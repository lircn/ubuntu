#!/bin/bash

P=`readlink -f $(dirname $0)`

# vim files
echo -n "Backup your original vim files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf ~/.vim_backup; mv -f ~/.vim ~/.vim_backup
    rm -f ~/.vimrc_backup; mv -f ~/.vimrc ~/.vimrc_backup
fi

rm -rf ~/.vim
rm -f ~/.vimrc

# vim files
ln -sd $P ~/.vim
ln -s $P/_vimrc ~/.vimrc

echo "=== DONE! ==="

# setup dictionary
echo -n "Setup dictionary? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    sudo sh -c "apt-get install stardict"
    sudo sh -c "apt-get install sdcv"
    mkdir /tmp/lir_dictionary
    cp $P/dictionary/* /tmp/lir_dictionary/
    cd /tmp/lir_dictionary
    tar -xjf stardict-langdao-ec-gb-2.4.2.tar.bz2
    rm stardict-langdao-ec-gb-2.4.2.tar.bz2
    tar -xjf stardict-langdao-ce-gb-2.4.2.tar.bz2
    rm stardict-langdao-ce-gb-2.4.2.tar.bz2
    sudo sh -c "mv -u ./stardict-langdao-* /usr/share/stardict/dic/"
    cd -
    rm -rf /tmp/lir_dictionary
    echo "=== DONE! ==="
fi

exit 0
