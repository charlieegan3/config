{ pkgs, config, ... }:

let
  configDirPath = ./extraLuaConfig;
  configFileList = builtins.attrNames (builtins.readDir configDirPath);
  configFiles = map (fileName: builtins.readFile "${configDirPath}/${fileName}") configFileList;
in
{
  home.file = {
    ftplugin = {
      recursive = true;
      source = ./ftplugin;
      target = "${config.home.homeDirectory}/.config/nvim/ftplugin";
    };
  };

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = builtins.concatStringsSep "\n" configFiles;

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
  };

  imports = [
    ./modules/completion/completion.nix

    ./modules/langs/nix/nix.nix
    ./modules/langs/go/go.nix
    ./modules/langs/rego/rego.nix
    ./modules/langs/lua/lua.nix
    ./modules/langs/css/css.nix
    ./modules/langs/json/json.nix
    ./modules/langs/html/html.nix
    ./modules/langs/js/js.nix
  ];
}

