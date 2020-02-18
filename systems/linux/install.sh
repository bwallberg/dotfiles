#!/bin/sh

# install node
sudo pacman -S nodejs-lts-erbium npm

# install neovim and vim-plug
sudo pacman -S neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fonts
sudo pacman -S powerline-fonts

# install ag
sudo pacman -S the_silver_searcher
