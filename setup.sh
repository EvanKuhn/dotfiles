#!/bin/bash

# Copy the basics
echo "Setting up $HOME"
cp -v .bash_profile ~
cp -v .bashrc ~
cp -v .gitconfig ~
cp -v .profile ~

# Copy VIM config files
echo "Setting up ~/.vim"
rm -rf ~/.vim
./setup_vim.sh
cp -v .vimrc ~

# Set up git
#echo "Setting up git configs"
#git config --global --replace-all user.name Evan Kuhn
#git config --global --replace-all user.email ejkuhn@gmail.com 
#git config --global --replace-all branch.master.mergeoptions --no-ff --no-commit
#git config --global --replace-all color.ui true
#git config --global --replace-all core.editor vim

