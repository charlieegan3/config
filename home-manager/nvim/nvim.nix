{ pkgs, ... }:

let
  cfgDarkMode = builtins.readFile ./dark_mode.lua;
  cfgKeyBindings = builtins.readFile ./keybindings.lua;
in
{
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

      nvim-treesitter # needed for highlighting
    ];

    extraLuaConfig = cfgDarkMode + cfgKeyBindings + ''
      vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!vendor*" --glob "!.git/*"'

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function() vim.lsp.buf.format() end,
      })

      -- Enable line numbers and set number col width
      vim.opt.number = true
      vim.opt.numberwidth = 3
    '';
  };

  imports = [
    ./modules/completion/completion.nix

    ./modules/langs/nix/nix.nix
    ./modules/langs/go/go.nix
  ];
}

