{ config, lib, pkgs, ... }:

let
  binDir = "${config.home.homeDirectory}/.nix-profile/bin";
in
{
  home.activation = {
    reloadTmux = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if ${binDir}/tmux ls > /dev/null 2>&1; then
        ${binDir}/tmux source-file ${config.home.homeDirectory}/.config/tmux/tmux.conf
      fi
    '';
  };
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    baseIndex = 1;
    keyMode = "vi";
    terminal = "tmux-256color";
    historyLimit = 100000;
    escapeTime = 0;
    plugins = with pkgs; [
      tmuxPlugins.yank
      tmuxPlugins.urlview # prefix+u
    ];
    extraConfig = ''
      # vim directions for panes
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # default is space, but v is more Vim-like
      bind-key -T copy-mode-vi v send-keys -X begin-selection

      # resizes
      bind-key H resize-pane -L 15
      bind-key J resize-pane -D 15
      bind-key K resize-pane -U 15
      bind-key L resize-pane -R 15

      # pane and window creation with current path maintained
      bind-key s split-window -h -c "#{pane_current_path}"
      bind-key v split-window -v -c "#{pane_current_path}"
      bind-key c new-window -c "#{pane_current_path}"

      # kill borked panes
      unbind q
      bind-key q killp

      set-option -g renumber-windows on

      # no clock, hostname, etc.
      set -g status-right ""
      set -g status-left ""
    '';
  };
}

