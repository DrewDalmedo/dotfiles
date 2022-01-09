#!/bin/bash

getVundle() {
    echo "Downloading Vundle..."
    git clone "https://github.com/VundleVim/Vundle.vim" ~/.vim/bundle/Vundle.vim &>/dev/null
    echo "Installing plugins..."
    vim +PluginInstall +qall &>/dev/null || (echo "Error: Vundle didn't install correctly! Exiting script..."; exit 0)
    echo "Vundle successfully installed!"
}

# main part of the program
echo "Bootstrapping vim..."

# check if vim is installed
which vim &>/dev/null || (echo "Error: vim is not installed! Exiting script..."; exit 0)

# get vundle and install the plugins
(which git &>/dev/null && ln ./.vimrc ~/.vimrc; getVundle) || (echo "Error: command 'git' not found! Exiting script..."; exit 0)

