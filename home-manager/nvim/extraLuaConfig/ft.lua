-- Create an augroup for file type overrides
local ft_overrides = vim.api.nvim_create_augroup("ft_overrides", { clear = true })

-- Function to create autocmds for file type setting
local function set_ft(filetype, patterns)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = patterns,
		group = ft_overrides,
		command = "set ft=" .. filetype,
	})
end

-- Define the file types and their corresponding patterns
local filetypes = {
	c = { "*.conf" },
	dockerfile = { "*Dockerfile*" },
	eruby = { "*.html.erb", "*.html.plush" },
	jenkins = { "*Jenkinsfile*" },
	json = { "*.json.tpl" },
	markdown = { "*.md", "*.mdx" },
	rego = { "*.rego", "*.rq" },
	ruby = { "Gemfile", "Rakefile", "Vagrantfile", "Thorfile", "Procfile", "*.ru", "*.rake", "*.json.jbuilder", "*.rb.no" },
	sh = { "*.sh.tpl" },
	terraform = { "*.tf.template", "*.hcl" },
	vim = { ".vim_config" },
	yaml = { "*.yaml.tpl" },
}

-- Iterate over the table and set autocmds
for filetype, patterns in pairs(filetypes) do
	set_ft(filetype, patterns)
end
