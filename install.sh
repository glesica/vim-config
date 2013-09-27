#!/bin/bash

# Simple script to install Vim configuration files in the home directory. Uses
# symlinks instead of copying the files. Creates a backup of the existing
# configuration by appending '.bak'.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo 'Linking .vim'
mv ~/.vim ~/.vim.bak
ln -s $DIR/vim ~/.vim

echo 'Linking .vimrc'
mv ~/.vimrc ~/.vimrc.bak
ln -s $DIR/vimrc ~/.vimrc

echo 'Linking .gvimrc'
mv ~/.gvimrc ~/.gvimrc.bak
ln -s $DIR/gvimrc ~/.gvimrc
