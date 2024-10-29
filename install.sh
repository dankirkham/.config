#!/usr/bin/env sh
echo Copying configs...
cp -R ./config ~/.config

sh scripts/install_neovim.sh
sh scripts/install_tmux.sh
