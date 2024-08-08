{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    dprint
  ];

  home.file = {
    # this must be here so that it's in a parent dir of files in ~/Code
    "${config.home.homeDirectory}/dprint.json" = {
      text = builtins.readFile ./dprint.json;
    };
  };

  programs.neovim = {

    extraLuaConfig = ''
      local capabilities_json = require('cmp_nvim_lsp').default_capabilities()

      require('lspconfig').dprint.setup {
        capabilities = capabilities_json,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "jsonc",
          "markdown",
          "python",
          "toml",
          "rust",
          "roslyn",
          "html",
          "yaml",
        }
      }
    '';
  };
}
