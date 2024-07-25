{ config, lib, pkgs, ... }:

let
  binDir = "${config.home.homeDirectory}/.nix-profile/bin";

  template = builtins.readFile ./wezterm/wezterm.lua;

  generateFile = template: {
    inherit binDir;
    content = builtins.replaceStrings [ "{{binDir}}" ] [ binDir ] template;
  };

  wezTermConfig = generateFile template;
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = wezTermConfig.content;
  };
}

