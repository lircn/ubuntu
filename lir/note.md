
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


wireshark
---------
sudo apt-get install wireshark
由于Linux的权限管理，安装完之后使用普通用户打开wireshark不能进行抓包，要进行如下操作：
sudo apt-get install libcap2-bin
sudo groupadd wireshark
sudo usermod -a -G wireshark [你的用户名]
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 4750 /usr/bin/dumpcap
setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
然后注销，再登录，即可以普通用户使用wireshark。
