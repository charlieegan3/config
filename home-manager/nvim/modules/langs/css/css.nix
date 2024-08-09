{ pkgs, ... }:

{
  home.packages = with pkgs; [ vscode-langservers-extracted ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nvim-treesitter-parsers.css ];

    extraLuaConfig = ''
      local capabilities_css = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').cssls.setup {
        capabilities = capabilities_css,
      }
    '';
  };
}
