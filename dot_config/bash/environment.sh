#!/usr/bin/env bash

# default mac path
export PATH="/opt/homebrew/opt/gnu-getopt/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# these come first since they are used in the setting of the path
eval $(/opt/homebrew/bin/brew shellenv)
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export GOPROXY="https://proxy.golang.org"

export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export EDITOR=nvim
