{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    dprint
  ];

  home.file = {
    "${config.home.homeDirectory}/.config/dprint/dprint.json" = {
      text = builtins.readFile ./dprint.json;
    };

  };
}
