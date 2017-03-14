#!/bin/bash

# Ensure admin account is accessible to brew pacakges
sudo -v
sudo chgrp -R admin /usr/local
sudo chmod -R g+w /usr/local

# Dont continue on error
set -e

current_path=$(pwd)

command_exists() {
    type "$1" &>/dev/null
}

install_antigen() {
    echo " install_antigen"
    curl curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.1/bin/antigen.zsh > ~/.dotfiles/zsh/antigen.zsh
}

install_brew() {
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ./lib/brew
}

if ! command_exists antigen; then
    echo "  Installing antigen for you..."
    install_antigen
fi

if ! command_exists brew; then
    echo "  Installing homebrew for you..."
    install_brew
fi

# Add zsh to list of shells & set default
if command_exists zsh; then
    echo " Add zsh to list of shells & set as default"
    sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
    sudo chsh -s /usr/local/bin/zsh
fi

# Set osx defaults
echo " Set osxdefaults"
./lib/osxdefaults

DOT_FILES=(
    'hushlogin'
    'zshrc'
    'gitignore'
    'gitinclude'
    'gitattributes'
)

for file in ${DOT_FILES[@]}
do
    if [ -e ~/.$file ]; then
        echo "$file already exists"
    else
        ln -s $current_path/$file ~/.$file
        echo "Symlink was created: $file"
    fi
done

echo "Everything is installed"