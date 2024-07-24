{ config, ... }:

{
  programs.readline = {
    enable = true;

    bindings = {
      "\\e[A" = "history-search-backward";
      "\\e[B" = "history-search-forward";
      "\\C-w" = "unix-word-rubout";
    };

    extraConfig = ''
      set completion-ignore-case on
    '';
  };
}
