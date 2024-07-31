{ pkgs, userName, mac-app-util, ... }:

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
    xdg-utils # needed for open
    util-linux # rev
    uutils-coreutils-noprefix # cut
    toybox # clear
    gawk # awk
    which
    tree
    entr
    ffmpeg
    jq
    yq
    htop
    ripgrep
    xz

    gh
    nodejs # needed by gh, and copilot

    colima
  ];

  imports = [
    mac-app-util.homeManagerModules.default

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

    ./casks.nix
  ];
}
