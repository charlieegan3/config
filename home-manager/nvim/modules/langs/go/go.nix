{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    golangci-lint-langserver
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [ nvim-treesitter-parsers.go ];

    extraLuaConfig = builtins.readFile ./config.lua;
  };
}
