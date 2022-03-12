#!/usr/bin/env bash

if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
  source /usr/share/fzf/shell/key-bindings.bash
fi

if [ -f $HOME/.local/bin/zed.sh ]; then
  export _Z_CMD=j
  source $HOME/.local/bin/zed.sh
fi

if [ -f "$(which direnv || true)" ]; then
  eval "$(direnv hook bash)"
fi

if [ -e "$(which kubectl 2>/dev/null)" ]; then
  source <(kubectl completion bash)
fi

if [ -d "/usr/share/google-cloud-sdk" ]; then
  source /usr/share/google-cloud-sdk/completion.bash.inc
fi

if [ -d "$HOME/google-cloud-sdk" ]; then
  source "$HOME/google-cloud-sdk/path.bash.inc"
  source "$HOME/google-cloud-sdk/completion.bash.inc"
fi

if [[ -e $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm
fi

export GPG_TTY=`tty`
export GPG_AGENT_INFO

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
