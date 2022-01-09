#!/bin/bash

getVundle() {
    echo "Downloading Vundle..."
    git clone "https://github.com/VundleVim/Vundle.vim" ~/.vim/bundle/Vundle.vim &>/dev/null
    echo "Installing plugins..."
    vim +PluginInstall +qall &>/dev/null || (echo "Error: Vundle didn't install correctly! Exiting script..."; exit 0)
    echo "Vundle successfully installed!"
}

installDependenciesDeb() {
    echo "Installing YouCompleteMe dependencies..."
    (apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm -y &>/dev/null) || (echo "Error: could not install dependencies! Exiting script..."; exit 0)
    echo "Compiling YouCompleteMe..."
    python3 ~/.vim/bundle/YouCompleteMe/install.py --all &>/dev/null
    echo "YouCompleteMe successfully installed!"
}

# main part of the program
echo "Bootstrapping vim..."

# check if vim is installed
which vim &>/dev/null || (echo "Error: vim is not installed! Exiting script..."; exit 0)

# get vundle and install the plugins
(which git &>/dev/null && ln ./.vimrc ~/.vimrc; getVundle) || (echo "Error: command 'git' not found! Exiting script..."; exit 0)

# compile YouCompleteMe
(which apt &>/dev/null && installDependenciesDeb) || (echo "Error: System is not deb-based, could not install YCM dependencies."; exit 0)

echo "\n"
echo "Done! Enjoy your new vim config!"
