# Vim Configuration

George Lesica <george@lesica.com>

## Setup

This is my Vim configuration. It uses Vundle to manage plugins and includes a
handy script to set up all the necessary symlinks without clobbering the
existing configuration files.

Some notes on setup and using Vundle:

Vundle is included as a submodule to make installation simpler. To clone:

    git submodule init
    git submodule update

To add an additional plugin repo just add an entry in the vimrc file.

    Plugin 'tpope/vim-fugitive' " Adds fugitive plugin

To install plugins:

    :PluginInstall

Or, from the shell, to install plugins and quit:

    vim +PluginInstall +qall

## Features

There isn't a whole lot going on here, but there are a couple convenient
features.

  * `C-k`, `C-j` - move the current line up or down, respectively
  * `C-a` - switch to the next buffer
  * `<leader>stt` - change spaces to tabs in busted Makefiles
  * `<leader>tws` - get rid of trailing whitespace
  * `<leader>ev` - edit the `vimrc`
  * `<leader>sv` - source the `vimrc`

