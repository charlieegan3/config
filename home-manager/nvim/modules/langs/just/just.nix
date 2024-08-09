{ pkgs, ... }:

{
  home.packages = with pkgs; [ just ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter-parsers.just
      conform-nvim
    ];

    extraLuaConfig = builtins.readFile ./config.lua;
  };
}
