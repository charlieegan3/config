{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode-langservers-extracted
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-parsers.json
    ];

    extraLuaConfig = ''
      local capabilities_json = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').jsonls.setup {
        capabilities = capabilities_json,
      }
    '';
  };
}
