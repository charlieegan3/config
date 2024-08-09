{ pkgs, ... }:

{
  home.packages = with pkgs; [ vscode-langservers-extracted ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nvim-treesitter-parsers.html ];

    extraLuaConfig = ''
      local capabilities_html = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').html.setup {
        capabilities = capabilities_html,
      }
    '';
  };
}
