#!/bin/bash

# install prerequisites

PACKAGES=  \
  curl     \
  libc-dev \
  git      \

apt-get install -y $PACKAGES

#
# install Rust
#

RUSTC=`which rustc`

if [ "$RUSTC" == "" ]; then
        curl -LSso /tmp/rustup.sh https://sh.rustup.rs
        sh /tmp/rustup.sh -y
        /root/.cargo/bin/rustup install nightly
fi

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
