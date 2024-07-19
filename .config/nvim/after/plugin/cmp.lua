local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode')

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,preview,noselect'
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
  mapping = cmp.mapping.preset.insert({
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})
