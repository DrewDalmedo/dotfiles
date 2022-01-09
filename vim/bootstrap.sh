#!/bin/bash

getVundle() {
    git clone "https://github.com/VundleVim/Vundle.vim" ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall &>/dev/null
}

# main part of the program
echo "Bootstrapping vim..."

# check if vim is installed
which vim &>/dev/null || (echo "Error: vim is not installed! Exiting script..."; exit 0)

# get vundle and install the plugins
(which git &>/dev/null && ln ./.vimrc ~/.vimrc; getVundle) || (echo "Error: command 'git' not found! Exiting script..."; exit 0)

