{ config, ... }:

{
  programs.navi.enable = true;
  home.file = {
    cheats = {
      recursive = true;
      source = ./cheats;
      target = "${config.home.homeDirectory}/.local/share/navi/cheats";
    };
  };
}

