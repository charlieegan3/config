-- init Copilot plugin
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    gitrebase = false,
  },
})

-- next, set up cmp, the Completion plugin
require("copilot_cmp").setup()

-- finally, set up cmp, the general completion plugin
local cmp = require("cmp")

cmp.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<tab>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'luasnip' }, -- required for cmp

    { name = 'nvim_lsp' },

    { name = 'path' },
    { name = 'buffer' },

    { name = "copilot" },
  })
})
