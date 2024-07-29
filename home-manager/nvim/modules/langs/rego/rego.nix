{ pkgs, ... }:

{
  home.packages = with pkgs; [
    regal
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-parsers.rego
    ];

    extraLuaConfig = ''
      local capabilities_rego = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').regal.setup {
        capabilities = capabilities_rego,
      }
    '';
  };
}
