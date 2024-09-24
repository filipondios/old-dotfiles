-----------------------------------------
-- Nvim LSP (language smarts) settings --
-----------------------------------------

require('mason').setup({
  ui = {
    keymaps = { uninstall_package = 'x' },
    border = 'single',
    height = 0.6,
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = '',
    },
  }
})

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  ensure_installed = { 'lua_ls' }
})
mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({})
  end,
})

require('lspsaga').setup({
  definition = {
    width = 0.8,
    height = 0.6
  },
  delay = 0,
  lightbulb = {
    enable = false
  }
})
