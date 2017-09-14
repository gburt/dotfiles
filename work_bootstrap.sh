#!/bin/bash

echo "source $HOME/dotfiles/.vimrc" >> .vimrc
cat dotfiles/.gitconfig >> .gitconfig
cat dotfiles/.bashrc >> .bashrc
