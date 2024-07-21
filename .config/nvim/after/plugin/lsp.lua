require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'hls' },
  automatic_installation = true
})

local lspconfig = require('lspconfig')
require('cmp_nvim_lsp')

lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.hls.setup({})
