{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-parsers.go
    ];

    extraLuaConfig = ''
      local capabilities_go = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').gopls.setup {
        capabilities = capabilities_go,
        settings = {
          gopls = {
            gofumpt = true, 
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      }
    '';
  };
}
