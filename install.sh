#!/bin/bash

set -e
set -o pipefail
set -u

# install prerequisites

read -r -d '' PACKAGES << EOF || true
  curl
  gcc
  git
  libc-dev
EOF

apt-get install -y $PACKAGES

#
# install Rust
#

if [ "" == "$(which rustc)" ]; then
  curl -LSso ~/rustup.sh https://sh.rustup.rs
  sh ~/rustup.sh -y
  ~/.cargo/bin/rustup update
  ~/.cargo/bin/rustup install nightly
  ~/.cargo/bin/rustup default nightly
fi

grep ".cargo/bin" ~/.bashrc > /dev/null || echo "PATH=~/.cargo/bin:\$PATH" >> ~/.bashrc
PATH=~/.cargo/bin:$PATH

#
# install Pathogen for Vim
#

if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  grep "syntax on"                 ~/.vimrc > /dev/null || echo "syntax on"                 >> ~/.vimrc
  grep "filetype plugin indent on" ~/.vimrc > /dev/null || echo "filetype plugin indent on" >> ~/.vimrc
  grep "execute pathogen#infect()" ~/.vimrc > /dev/null || echo "execute pathogen#infect()" >> ~/.vimrc
fi

#
# install Rust syntax highlighting for Vim
#

if [ ! -d ~/.vim/bundle/rust.vim ]; then
  git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
fi

#
# install rustfmt
#

if [ ! -f ~/.cargo/bin/rustfmt ]; then
  rustup component add rustfmt-preview

  grep "RustFmt" ~/.vimrc > /dev/null || echo "nmap <Leader>f :RustFmt<CR>" >> ~/.vimrc
fi
