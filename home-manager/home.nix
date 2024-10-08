{
  pkgs,
  userName,
  mac-app-util,
  gpxifPkgs,
  agenix,
  ...
}:

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
    nixVersions.nix_2_22

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
    just
    imagemagick
    wakelan
    rclone

    gpxifPkgs.default

    age
    # secret management
    agenix.packages.${system}.default

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
    ./bash/bash.nix
    ./readline.nix
    ./starship.nix
    ./atuin.nix
    ./yazi.nix
    ./gron.nix
    ./zoxide.nix
    ./navi/navi.nix

    ./git/git.nix

    ./wezterm.nix

    ./dprint/dprint.nix

    ./casks.nix
  ];
}
