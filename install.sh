#!/bin/bash
#
#   .vimrc && .vim files installation for linux and mac os X
#
mkdir -p ~/.vim
mkdir -p ~/.temp
cp ./.vimrc ~/.vimrc
cp ./.vim/.vimrc.* ~/.vim
cp -r ./.vim/* ~/.vim
