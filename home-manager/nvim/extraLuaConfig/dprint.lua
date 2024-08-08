local capabilities_dprint = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').dprint.setup {
	capabilities = capabilities_dprint,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
		"markdown",
		"toml",
		"yaml",
	}
}
