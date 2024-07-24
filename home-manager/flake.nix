{
  description = "Home Manager configuration of charlieegan3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."charlieegan3" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          {
            home.packages = with pkgs; [
              home-manager
              git
              htop
              which
              direnv
              entr
              ffmpeg
              fzf
              jq
              yq
              gh
              tree
              autojump

              xdg-utils # needed for open
              util-linux # rev
              uutils-coreutils-noprefix # cut
              toybox # clear
              gawk # awk
            ];
          }
        ];
      };
    };
}
