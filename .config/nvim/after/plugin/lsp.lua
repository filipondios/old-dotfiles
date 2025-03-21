-----------------------------------------
-- Nvim LSP (language smarts) settings --
-----------------------------------------

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

mason.setup({
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


local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = { 'lua_ls' }
})
mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities
    })
  end
})


local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

lspsaga.setup({
  definition = {
    width = 0.8,
    height = 0.6
  },
  delay = 0,
  lightbulb = {
    enable = false
  }
})
