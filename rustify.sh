#!/bin/bash

# install prerequisites

read -r -d '' PACKAGES << EOF
  curl
  git
  libc-dev
EOF

apt-get install -y $PACKAGES

#
# install Rust
#

if [ "$RUSTC" == `which rustc` ]; then
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
# install racer
#

if [ ! -f /root/.cargo/bin/racer ]; then
  cargo install racer
  rustup component add rust-src

  grep "RUST_SRC_PATH" ~/.bashrc > /dev/null || echo 'export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"' >> ~/.bashrc

  git clone --depth=1 https://github.com/racer-rust/vim-racer.git ~/.vim/bundle/vim-racer

  grep "set hidden"         ~/.vimrc > /dev/null || echo "set hidden"                                            >> ~/.vimrc
  grep "let g:racer_cmd"    ~/.vimrc > /dev/null || echo 'let g:racer_cmd = "/root/.cargo/bin/racer"'            >> ~/.vimrc
  grep "rust-def)"          ~/.vimrc > /dev/null || echo "au FileType rust nmap gd <Plug>(rust-def)"             >> ~/.vimrc
  grep "rust-def-split)"    ~/.vimrc > /dev/null || echo "au FileType rust nmap gs <Plug>(rust-def-split)"       >> ~/.vimrc
  grep "rust-def-vertical)" ~/.vimrc > /dev/null || echo "au FileType rust nmap gx <Plug>(rust-def-vertical)"    >> ~/.vimrc
  grep "rust-def-doc)"      ~/.vimrc > /dev/null || echo "au FileType rust nmap <leader>gd <Plug>(rust-def-doc)" >> ~/.vimrc
fi
