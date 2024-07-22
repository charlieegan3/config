{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nil # nix language server
    nixpkgs-fmt # formatter
  ];

  programs.neovim = {
    extraLuaConfig = ''
      local capabilities_nix = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').nil_ls.setup {
        capabilities = capabilities_nix,
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
