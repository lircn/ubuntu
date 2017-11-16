
# vim
# setup

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

配置unbuntu全局编辑器
    export EDITOR = vim

    ln -s ~/git/ubuntu/bin ~/
    ln -s ~/git/ubuntu/vim/snippets ~/.vim/bundle/snipMate/
    ln -s ~/git/ubuntu/_vimrc ~/.vimrc

## YCM

Setup YCM (https://github.com/Valloric/YouCompleteMe)

[root@localhost bundle]# git clone https://github.com/Valloric/YouCompleteMe

[root@localhost YouCompleteMe]# git submodule update --init --recursive  #这步必须要有

read the doc
cmake -G "Unix Makefiles" . /home/lizheng/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
需要执行 install.py

## ag
:ag xx
当前路径下查找xx
在Ag查找出来的quickfix窗口中，你可以使用下列命令：

e    to open file and close the quickfix window
o    to open (same as enter)
go   to preview file (open but maintain focus on ag.vim results)
t    to open in new tab
T    to open in new tab silently
h    to open in horizontal split
H    to open in horizontal split silently
v    to open in vertical split
gv   to open in vertical split silently
q    to close the quickfix window))


# tmux

Hit prefix + I to fetch the plugin and source it. The plugin will automatically start "working" in the background, no action required.

# hans
    git clone http://github.com/hh123okbb/hans
    /hans$ make
    /hans$ sudo ./hans -c -p lir -n lir

ssh on tunnel
    ssh -CNvg -D 127.0.0.1:1080 myhost

server
    hans -d -p -s -n


# wireshark
sudo apt-get install wireshark
由于Linux的权限管理，安装完之后使用普通用户打开wireshark不能进行抓包，要进行如下操作：
    sudo apt-get install libcap2-bin
    sudo groupadd wireshark
    sudo usermod -a -G wireshark [你的用户名]
    sudo chgrp wireshark /usr/bin/dumpcap
    sudo chmod 4750 /usr/bin/dumpcap
    setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
然后注销，再登录，即可以普通用户使用wireshark。

