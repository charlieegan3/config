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
	terraform = { "*.tf.template", "*.hcl" },
	ruby = { "Gemfile", "Rakefile", "Vagrantfile", "Thorfile", "Procfile", "*.ru", "*.rake", "*.json.jbuilder", "*.rb.no" },
	vim = { ".vim_config" },
	c = { "*.conf" },
	dockerfile = { "*Dockerfile*" },
	jenkins = { "*Jenkinsfile*" },
	yaml = { "*.yaml.tpl" },
	sh = { "*.sh.tpl" },
	json = { "*.json.tpl" },
	markdown = { "*.md", "*.mdx" },
	eruby = { "*.html.erb", "*.html.plush" }
}

-- Iterate over the table and set autocmds
for filetype, patterns in pairs(filetypes) do
	set_ft(filetype, patterns)
end
