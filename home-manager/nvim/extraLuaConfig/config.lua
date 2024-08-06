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

-- Set undo, backup, and swap file directories
vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undo/")
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/.backup/")
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
