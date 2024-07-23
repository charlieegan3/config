{ pkgs, config, ... }:

let
  cfgDarkMode = builtins.readFile ./dark_mode.lua;
  cfgKeyBindings = builtins.readFile ./keybindings.lua;
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

      -- Keep some space between top/bottom of screen and cursor
      vim.opt.scrolloff = 5
      
      -- Disable error bells
      vim.opt.errorbells = false
      
      -- Draw a column to guide line length at 80 characters
      vim.opt.colorcolumn = "80"
      
      -- Don't wrap lines
      vim.opt.wrap = false
      
      -- Set file format to Unix
      vim.opt.fileformat = "unix"

      -- Maintain undo history
      vim.opt.undofile = true
      
      -- Set undo directory
      vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undo/")
      
      -- Set backup directory
      vim.opt.backupdir = vim.fn.expand("~/.config/nvim/.backup/")
      
      -- Set swap file directory
      vim.opt.directory = vim.fn.expand("~/.config/nvim/.swp/")

      -- Set shift width to 4
      vim.opt.shiftwidth = 4
      
      -- Enable smart tab and smart indent
      vim.opt.smarttab = true
      vim.opt.smartindent = true
      
      -- Set tab stop to 4
      vim.opt.tabstop = 4
      
      -- Display tabs as >-
      vim.opt.list = true
      vim.opt.listchars = { tab = ">-" }
      
      -- Set backspace behavior
      vim.opt.backspace = { "indent", "eol", "start" }

      -- Create an augroup for file type overrides
      local ft_overrides = vim.api.nvim_create_augroup("ft_overrides", { clear = true })
      
      -- Function to create autocmds for file type setting
      local function set_ft(filetype, patterns)
          vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
              pattern = patterns,
              group = ft_overrides,
              command = "set ft=" .. filetype,
          })
      end
      
      -- Define the file types and their corresponding patterns
      local filetypes = {
          terraform = {"*.tf.template", "*.hcl"},
          ruby = {"Gemfile", "Rakefile", "Vagrantfile", "Thorfile", "Procfile", "*.ru", "*.rake", "*.json.jbuilder", "*.rb.no"},
          vim = {".vim_config"},
          c = {"*.conf"},
          dockerfile = {"*Dockerfile*"},
          jenkins = {"*Jenkinsfile*"},
          yaml = {"*.yaml.tpl"},
          sh = {"*.sh.tpl"},
          json = {"*.json.tpl"},
          markdown = {"*.md"},
          eruby = {"*.html.erb", "*.html.plush"}
      }
      
      -- Iterate over the table and set autocmds
      for filetype, patterns in pairs(filetypes) do
          set_ft(filetype, patterns)
      end
    '';
  };

  imports = [
    ./modules/completion/completion.nix

    ./modules/langs/nix/nix.nix
    ./modules/langs/go/go.nix
  ];
}

