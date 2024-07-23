require('mason').setup()
require('mason-lspconfig').setup()
require("mason-lspconfig").setup_handlers ({
  function(server_name)
    require("lspconfig")[server_name].setup {}
  end,
})
require('lspsaga').setup({
  lightbulb = {
    enable = false
  }
})
