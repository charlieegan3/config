{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua
    lua-language-server
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nvim-treesitter-parsers.lua ];

    extraLuaConfig = ''
      local capabilities_lua = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').lua_ls.setup {
        capabilities = capabilities_lua,
        settings = { },
      }
    '';
  };
}
