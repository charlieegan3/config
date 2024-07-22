{ pkgs, ... }:

let
  cfgCompletion = builtins.readFile ./completion.lua;
in
{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-cmp # completions display plugin

      cmp-nvim-lsp # lsp completions for cmp
      luasnip # requirement of cmp
      cmp-buffer # completions from buffer
      cmp-path # completions from path

      copilot-lua # gh copilot
      copilot-cmp # complletions from copilot
    ];

    extraLuaConfig = cfgCompletion;
  };
}
