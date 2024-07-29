{
  description = "Home Manager configuration of charlieegan3";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "4cf7951a91440879f61e05460441762d59adc017";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      rev = "a11cfcd0a18fdf6257808da631a956800af764bf";
    };
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
        ];
      };
    };
}
