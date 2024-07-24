{ ... }:

let
  userName = "charlieegan3";
in
{
  home.username = userName;
  home.homeDirectory = "/Users/${userName}";
  home.stateVersion = "24.05";

  home.file = { };
  home.sessionVariables = { };

  programs.home-manager.enable = true;

  imports = [
    ./tmux.nix
    ./bash.nix
    ./readline.nix
    ./nvim/nvim.nix
    ./autojump.nix

    ./wezterm.nix
  ];
}
