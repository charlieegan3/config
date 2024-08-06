{ config, ... }:

let
  binDir = "${config.home.homeDirectory}/.nix-profile/bin";
  bashrcExtra = builtins.readFile ./bashrc.sh;
in
{
  programs.pls.enable = true;
  programs.bat.enable = true;

  programs.bash = {
    enable = true;

    historyFile = "${config.home.homeDirectory}/.bash_history";
    historyControl = [ "erasedups" "ignoreboth" ];
    historyIgnore = [ "exit" "history" ];

    sessionVariables = {
      PATH = "${binDir}:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin";
      VISUAL = "nvim";
      PS1 = "\\W \$ ";
    };

    bashrcExtra = bashrcExtra;

    shellAliases = {
      cat = "bat";
      ls = "pls";
      envrc = ''
        cat .envrc
        chflags nouchg .envrc
        vi .envrc
        direnv allow
        chflags uchg .envrc
      '';
      gitb = "git branch | grep '^\\*' | cut -d' ' -f2 | tr -d '\n'";
    };
  };
}
