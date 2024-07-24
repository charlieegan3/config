{ config, pkgs, ... }:

let
  binDir = "${config.home.homeDirectory}/.nix-profile/bin";
in
{
  programs.bash = {
    enable = true;

    historyControl = [ "erasedups" "ignoreboth" ];
    historyFile = "${config.home.homeDirectory}/..config/bash/.bash_history";
    historyIgnore = [ "exit" "history" ];

    sessionVariables = {
      PATH = "${binDir}:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin";
      VISUAL = "nvim";
      PS1 = "\\W \$ ";
    };

    shellAliases = {
      envrc = ''
        cat .envrc
        chflags nouchg .envrc
        vi .envrc
        direnv allow
        chflags uchg .envrc
      '';
      gitb = "git branch | grep '^\\*' | cut -d' ' -f2 | tr -d '\n'";
      bran = ''
        echo "Current: " $(gitb)
        git checkout $(git b | sed -e 's/^..//' | fzf)
      '';
    };
  };
}
