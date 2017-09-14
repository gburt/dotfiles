#!/bin/bash

# Link in the dotfiles
ln -s dotfiles/.bash_profile ~/.bash_profile
ln -s dotfiles/.gitconfig ~/.gitconfig

# Have the base .vimrc source my .vimrc to avoid squashing changes
echo "source $HOME/dotfiles/.vimrc" >> .vimrc
