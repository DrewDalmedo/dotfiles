#!/bin/sh

function getVundle() {
    git clone "https://github.com/VundleVim/Vundle.vim" ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

# main part of the program
echo "Bootstrapping vim..."

# check if vim is installed
if [ !command -v vim ]; then
    echo "Error: vim is not installed! Exiting script..."
    exit 0
fi

# get vundle and install the plugins
if [ command -v git ]; then
    ln -s ./.vimrc ~/.vimrc
    getVundle
else
    echo "Error: command 'git' not found! Exiting script..."
    exit 0
fi
