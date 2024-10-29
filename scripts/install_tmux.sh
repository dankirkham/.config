#!/usr/bin/env sh

TMUX_VERSION="3.2"
echo ========== 🪟 Building tmux ==========
sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
mkdir -p tmp_tmux
cd tmp_tmux
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar xvf tmux-${TMUX_VERSION}.tar.gz
rm tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure && make -j`nproc`
sudo make install
cd ../..
rm -rf tmp_tmux
