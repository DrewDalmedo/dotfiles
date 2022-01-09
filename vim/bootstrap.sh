#!/bin/bash

getVundle() {
    echo "Downloading Vundle..."
    git clone "https://github.com/VundleVim/Vundle.vim" ~/.vim/bundle/Vundle.vim &>/dev/null
    echo "Installing plugins..."
    vim +PluginInstall +qall &>/dev/null || (echo "Error: Vundle didn't install correctly! Exiting script..."; exit 0)
    echo "Vundle successfully installed!"
}

installDependenciesDeb() {
    echo "Installing basic dependencies (vim, git, etc)..."
    (sudo apt install vim git -y -qq &>/dev/null) || (echo "Error: could not install dependencies! Exiting script..."; exit 0)
    echo "Installing YouCompleteMe dependencies..."
    (sudo apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs default-jdk npm -y -qq &>/dev/null) || (echo "Error: could not install dependencies! Exiting script..."; exit 0)
}

installDependenciesBrew() {
    echo "Installing basic dependencies (vim, git, etc)..."
    (brew install git vim &>/dev/null) || (echo "Error: could not install dependencies! Exiting script..."; exit 0)
    echo "Installing YouCompleteMe dependencies..."
    (brew install cmake python go nodejs java) || (echo "Error: could not install dependencies! Exiting script..."; exit 0)
    (sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk) || (echo -e "Could not link Java successfully. Try running this command:\nsudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk"; exit 0)
}

compileYCM() {
    echo "Compiling YouCompleteMe..."
    python3 ~/.vim/bundle/YouCompleteMe/install.py --all &>/dev/null
    echo "YouCompleteMe successfully installed!"
}

# start of the script
echo "Bootstrapping vim..."

# install dependencies
(which apt &>/dev/null && installDependenciesDeb) || (which brew &>/dev/null && installDependenciesBrew) || (echo "Error: System is not suppported, could not install dependencies. Exiting script..."; exit 0)

# check if vim is installed
which vim &>/dev/null || (echo "Error: vim is not installed! Exiting script..."; exit 0)

# get vundle and install the plugins
(which git &>/dev/null && ln ./.vimrc ~/.vimrc; getVundle) || (echo "Error: command 'git' not found! Exiting script..."; exit 0)

# compile YouCompleteMe (YCM)
compileYCM 

echo ""
echo "Done! Enjoy your new vim config!"
