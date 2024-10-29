#!/usr/bin/env sh

echo ========== ⌨️ Installing neovim ==========
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
mkdir -p ~/.local/
tar xvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
mv nvim-linux64/* ~/.local/
