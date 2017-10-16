#!/bin/bash

set -x
set -e

cd $HOME

# configure dotfiles
git init .
git remote add -t \* -f origin https://github.com/charlieegan3/dotfiles.git
git fetch origin
git reset --hard origin/master
source ~/.bashrc > /dev/null

# configure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall -c qall! > /dev/null

goEditorTools=(
  github.com/nsf/gocode
  github.com/alecthomas/gometalinter
  golang.org/x/tools/cmd/goimports
  golang.org/x/tools/cmd/guru
  golang.org/x/tools/cmd/gorename
  github.com/golang/lint/golint
  github.com/rogpeppe/godef
  github.com/kisielk/errcheck
  github.com/klauspost/asmfmt/cmd/asmfmt
  github.com/fatih/motion
  github.com/fatih/gomodifytags
  github.com/zmb3/gogetdoc
  github.com/josharian/impl
)
for tool in "${goTools[@]}"
do
  go get "$tool"
done

# own it
chown -R charlieegan3 ~
