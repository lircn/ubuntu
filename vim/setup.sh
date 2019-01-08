#!/bin/bash

P=`pwd`

# vim file
# setup dictionary
echo -n "Setup dictionary? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    #sudo sh -c "apt-get install stardict"
    #sudo sh -c "apt-get install sdcv"
    mkdir /tmp/lir_dictionary
    cp $P/dictionary/* /tmp/lir_dictionary/
    cd /tmp/lir_dictionary
    tar -xjf stardict-langdao-ec-gb-2.4.2.tar.bz2
    rm stardict-langdao-ec-gb-2.4.2.tar.bz2
    tar -xjf stardict-langdao-ce-gb-2.4.2.tar.bz2
    rm stardict-langdao-ce-gb-2.4.2.tar.bz2
    sudo sh -c "mv ./stardict-langdao-* /usr/share/stardict/dic/"
    cd -
    rm -rf /tmp/lir_dictionary
    echo "=== DONE! ==="
fi

exit 0

echo -n "Backup your original vim files? (y/n)"
read IN
if [ "$IN" = "y" ] || [ "$IN" = "Y" ]; then
    rm -rf $HOME/.vim_backup; mv -f $HOME/.vim $HOME/.vim_backup
    rm -f $HOME/.vimrc_backup; mv -f $HOME/.vimrc $HOME/.vimrc_backup
fi

rm -rf $HOME/.vim
rm -f $HOME/.vimrc

# vim files
ln -sd $P $HOME/.vim
ln -s $P/_vimrc $HOME/.vimrc

echo "=== DONE! ==="

