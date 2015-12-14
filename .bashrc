# set paths
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH=/usr/local/texlive/2015/bin/x86_64-darwin:$PATH

# set prompt format
export PS1="\W|"

# use vim as the system editor
export VISUAL=vim
export EDITOR="$VISUAL"

# ignore dupes in history
export HISTIGNORE="&"

# Who knew ^R was a thing?
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# aliases
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias vi="vim"
alias ls="ls -A --color"
alias l="ls -d */ && ls -d .*/ --color && ls -pa | grep -v /"
alias gits="git status -sb"
alias gitb="git branch | grep '^\*' | cut -d' ' -f2 | tr -d '\n' | pbcopy"
alias gitc="git diff --cached --word-diff"

# welcome commander
echo "hello."

#fzf search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
