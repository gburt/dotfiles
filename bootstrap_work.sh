#!/bin/bash

# Link in the dotfiles (remove if already exists)
rm ~/.bash_profile 2> /dev/null || true
ln -s dotfiles/.bash_profile ~/.bash_profile
rm ~/.gitconfig 2> /dev/null || true
ln -s dotfiles/.gitconfig ~/.gitconfig
rm ~/.tmux.conf 2> /dev/null || true
ln -s dotfiles/.tmux.conf ~/.tmux.conf

# Have the base .vimrc source my .vimrc to avoid squashing changes
echo "source $HOME/dotfiles/.vimrc" >> .vimrc
git clone https://github.com/bkad/CamelCaseMotion .vim/bundle/CamelCaseMotion
