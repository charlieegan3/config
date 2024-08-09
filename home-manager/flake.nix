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

    brew-nix = {
      type = "github";
      owner = "BatteredBunny";
      repo = "brew-nix";
      rev = "5387a4fff65d313e82c24bdc856847532e052ea4";
    };

    brew-api = {
      type = "github";
      owner = "BatteredBunny";
      repo = "brew-api";
      rev = "90ee30ce2d3dfe17d616398cf4bba12ad3c57e20";
      flake = false;
    };

    mac-app-util = {
      type = "github";
      owner = "hraban";
      repo = "mac-app-util";
      rev = "63f269f737cafb2219ba38780c1ecb1dc24bc4a2";
    };

    pre-commit-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";
      rev = "c7012d0c18567c889b948781bc74a501e92275d1";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      home-manager,
      brew-nix,
      mac-app-util,
      ...
    }@inputs:
    let
      userName = "charlieegan3";
      utils = flake-utils;
    in
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ brew-nix.overlays.default ];
        };
      in
      {
        packages = {
          homeConfigurations.${userName} = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./home.nix ];
            extraSpecialArgs = {
              inherit userName mac-app-util;
            };
          };
        };

        checks = {
          pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              dprint = {
                enable = true;
                name = "dprint check";
                entry = "dprint check --allow-no-files";
              };
              nixfmt = {
                enable = true;
                name = "nixfmt check";
                entry = "nixfmt -c ";
                types = [ "nix" ];
              };
            };
          };
        };

        devShells = {
          default = pkgs.mkShell {
            #inherit (self.checks.${system}.pre-commit-check) shellHook;
            #buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;

            packages = with pkgs; [ nixfmt-rfc-style ];
          };
        };
      }
    );

}
