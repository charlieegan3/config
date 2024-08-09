{ pkgs, ... }:

{
  home.packages = with pkgs; [ vscode-langservers-extracted ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nvim-treesitter-parsers.javascript ];

    extraLuaConfig = ''
      local capabilities_js = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').eslint.setup {
        capabilities = capabilities_js,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      }
    '';
  };
}
