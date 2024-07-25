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


  programs = {
    home-manager.enable = true;
  };

  imports = [
    ./tmux.nix
    ./nvim/nvim.nix
    ./fzf.nix

    ./direnv.nix
    ./bash.nix
    ./readline.nix
    ./autojump.nix
    ./starship.nix
    ./atuin.nix
    ./yazi.nix

    ./wezterm.nix
  ];
}
