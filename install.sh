#!/bin/bash

# set work dir
WORK_DIR=`pwd`

# default package install
yum update -y
yum groupinstall -y "Development Tools"
yum install -y epel-release
yum install -y mosh

# go install
cd /tmp
wget https://golang.org/dl/go1.14.4.linux-amd64.tar.gz
tar -xzvf go1.14.4.linux-amd64.tar.gz
mv ./go /usr/local/
rm -rf /tmp/go1.14.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
/usr/local/go/bin/go version

# php install
cd /tmp
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php74
sudo yum update
sudo yum install -y php php-cli

# tmux install
yum install -y libevent-devel ncurses-devel gcc
cd /tmp
wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
tar xvzf tmux-3.1b.tar.gz
cd tmux-3.1b
./configure
make && sudo make install
rm -rf /tmp/tmux-3.1b.tar.gz
echo "alias tmux='/usr/local/bin/tmux'" >> ~/.bashrc

# latest vim + plugin install
yum remove -y vim-enhanced vim-common vim-filesystem
yum install -y npm gcc make cmake mercurial ncurses ncurses-devel python36-devel python36 python36-pip
yum install -y ctags cscope git tcl-devel ruby ruby-devel lua lua-devel luajit luajit-devel \
	python python-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp \
	perl-ExtUtils-CBuilder perl-ExtUtils-Embed
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp \
	--enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-luainterp
make && sudo make install
echo "alias vi='/usr/local/bin/vim'" >> ~/.bashrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --go-completer --ts-completer

# config files copy
cd ${WORK_DIR}
cp ./config/.tmux.config ~/.tmux.config
cp ./config/.vimrc ~/.vimrc
mkdir ~/.vim
cp ./config/.ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py

# finish
echo "run following step"
echo "1) source ~/.bashrc"
echo "2) tmux new -s <session name>"
echo "3) vi -> :PluginInstall"
echo "4) vi -> :GoInstallBinaries"