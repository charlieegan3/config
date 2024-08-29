-- Define a function to create directories if they don't exist
local function create_dirs_on_save()
	local dir = vim.fn.expand('<afile>:p:h') -- Get the directory path of the file being saved

	-- Check if the directory exists; if not, create it
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, 'p')
	end
end

-- Set up an autocommand to call the function before saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = create_dirs_on_save,
})

-- Format code on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function() vim.lsp.buf.format() end,
})

-- Set up removal of trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- Use internal formatting for bindings like gq.
-- LSP adopts gq for expression formatting.
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.bo[args.buf].formatexpr = nil
	end,
})
