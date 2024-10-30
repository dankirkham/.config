#!/usr/bin/env sh
echo ========== 📜 Copying configs ==========
mkdir -p ~/.config
cp -Rv .config/* ~/.config/

sh scripts/install_neovim.sh
# sh scripts/install_tmux.sh
