---------------------------------------------
-- Treesitter (code highlighting) settings --
---------------------------------------------

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup ({
  ensure_installed = { 'lua' },
  autopairs = { enable = true },
  indent = { enable = false },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
