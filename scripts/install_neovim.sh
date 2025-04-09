#!/usr/bin/env sh

echo ========== ⌨️ Installing neovim ==========
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
mkdir -p ~/.local/
tar xvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
cp -R nvim-linux-x86_64/* ~/.local/
rm -rf nvim-linux-x86_64
