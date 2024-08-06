-- Set mapleader
vim.g.mapleader = ";"

-- Movement mappings
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'B', '0', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'E', '$', { noremap = true, silent = true })

-- Buffer navigation
vim.api.nvim_set_keymap('n', 'L', ':only|up|bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', ':only|up|bp<CR>', { noremap = true, silent = true })

-- Open file/buffer finder
vim.api.nvim_set_keymap('n', '<SPACE>', ':up | :Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', ':up | :Buffers<CR>', { noremap = true, silent = true })

-- Go to definition
vim.api.nvim_set_keymap('n', '<Tab>', '<C-]>', { noremap = true, silent = true })

-- Open file text replace
vim.api.nvim_set_keymap('n', '<Down>', ':%s /', { noremap = true, silent = true })

-- Copy to system clipboard
vim.api.nvim_set_keymap('v', '<CR>', '"+y<CR>', { noremap = true, silent = true })

-- Exit insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Save and quit all files
vim.api.nvim_set_keymap('n', '<leader>q', ':wqall<CR>', { noremap = true, silent = true })

-- Write without autocmds
vim.api.nvim_set_keymap('n', '<leader>w', ':noautocmd w<CR>', { noremap = true, silent = true })

-- Reload config
vim.api.nvim_set_keymap('n', '<leader>r', ':lua dofile(vim.env.MYVIMRC)<CR>', { noremap = true, silent = true })
