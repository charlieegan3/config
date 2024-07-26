{ pkgs, ... }:

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

  home.packages = with pkgs; [
    htop
    which
    entr
    nodejs
    ffmpeg
    jq
    yq
    gh
    tree
    ripgrep

    go_1_22
    golangci-lint

    xdg-utils # needed for open
    util-linux # rev
    uutils-coreutils-noprefix # cut
    toybox # clear
    gawk # awk
  ];

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

    ./git/git.nix

    ./wezterm.nix
  ];
}
