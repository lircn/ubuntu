
vim
---
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

配置unbuntu全局编辑器
export EDITOR = vim

ln -s ~/git/ubuntu/bin ~/
ln -s ~/git/ubuntu/vim/snippets ~/.vim/bundle/snipMate/
ln -s ~/git/ubuntu/.vimrc ~/


hans
----
git clone http://github.com/hh123okbb/hans
/hans$ make
/hans$ sudo ./hans -c -p lir -n lir

ssh on tunnel
ssh -CfNg -D 127.0.0.1:1080 myhost
