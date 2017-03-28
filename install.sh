#!/bin/bash
ln -s $(realpath .vimrc) ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
