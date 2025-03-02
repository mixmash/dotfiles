#!/bin/sh

cd $HOME/Downloads
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb
sudo rm nvim-linux64.deb
sudo apt install python3-neovim
cd -

# Remove neovim
# Watch out - might remove the config files
# sudo apt autoremove --purge neovim*
