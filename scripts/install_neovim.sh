#!/usr/bin/env sh

echo Installing neovim...
wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage
mkdir -p ~/.local/
mkdir -p ~/.local/bin
mv nvim.appimage ~/.local/bin/nvim
