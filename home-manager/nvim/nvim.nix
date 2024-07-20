{ pkgs, ... }:

let
  cfgDarkMode = builtins.readFile ./cfg/dark_mode.lua;
in
{
  home.packages = with pkgs;
    [
      nil # nix language server
      nixpkgs-fmt # nix lang formatter
    ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      fzf-vim

      nvim-lspconfig

      unicode-vim # show unicode chars
      Rename # adds :Rename function
      vim-signify # show diff in gutter
      vim-surround # complete brackets etc.
      targets-vim # additional change-inside targets (', <>, etc)

      nvim-lastplace # remember the last location in file

      fidget-nvim # notifications from lsp etc
    ];

    extraLuaConfig = cfgDarkMode + ''
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() vim.lsp.buf.format() end,
      })
    '';
  };

  imports = [
    ./cfg/langs/nix/nix.nix
  ];
}

