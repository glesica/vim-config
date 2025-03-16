#!/bin/bash

# Simple script to install Vim configuration files in the home directory. Uses
# symlinks instead of copying the files. Creates a backup of the existing
# configuration by appending '.bak'.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config

echo 'Linking .config/nvim'
mv ~/.config/nvim ~/.config/nvim.bak
ln -s $DIR/vim ~/.config/nvim

echo 'Linking init.vim'
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
ln -s $DIR/vimrc ~/.config/nvim/init.vim

