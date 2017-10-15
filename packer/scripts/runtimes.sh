#!/bin/bash

set -x
set -e

cd $HOME

# ruby
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
rvmStable="https://raw.githubusercontent.com/wayneeseguin/rvm/stable/binscripts/rvm-installer"
\curl -sSL $rvmStable | bash -s stable --ruby --gems=bundler,rails,nokogiri

# node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
  && sudo apt-get install -y nodejs \
  && mkdir ~/.npm-global && npm config set prefix '~/.npm-global' && export PATH=~/.npm-global/bin:$PATH
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y nodejs

# go
apt-get install -y golang-go

# rust
curl -sSf https://static.rust-lang.org/rustup.sh | sh
