{ pkgs, ... }:

let
  cfgLSP = builtins.readFile ./lsp.lua;
in
{
  home.packages = with pkgs; [
    nil # nix language server
    nixpkgs-fmt # formatter
  ];

  programs.neovim = {
    extraLuaConfig = ''
      require('lspconfig').nil_ls.setup {
        settings = {
          ['nil'] = {
            formatting = {
              command = { "nixpkgs-fmt" },
            },
          },
        },
      }
    '';
  };
}
