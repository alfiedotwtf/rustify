#!/bin/bash

#
# install Rust
#

which rustc > /dev/null || curl -sf -L https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh

#
# install Pathogen for Vim
#

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

grep "syntax on" ~/.vimrc > /dev/null                 || echo "syntax on" >> ~/.vimrc
grep "filetype plugin indent on" ~/.vimrc > /dev/null || echo "filetype plugin indent on" >> ~/.vimrc
grep "execute pathogen#infect()" ~/.vimrc > /dev/null || echo "execute pathogen#infect()" >> ~/.vimrc

#
# install Rust syntax highlighting for Vim
#

if [ ! -d ~/.vim/bundle/rust.vim ]; then
	git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
fi
