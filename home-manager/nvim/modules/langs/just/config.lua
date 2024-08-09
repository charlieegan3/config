require("conform").setup({
	formatters_by_ft = {
		just = { "just" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "justfile",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
