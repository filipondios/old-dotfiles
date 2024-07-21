require('core.plugins')
require('core.mappings')

-- Settings
local set = vim.opt
set.autoindent = true
set.backup = false
set.clipboard = 'unnamedplus'
set.cursorline = true
set.autowrite = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.ruler = true
set.smartindent = true
set.termguicolors = true
set.number = true
set.history = 1000
set.cursorline = true
set.swapfile = false
set.ignorecase = true
set.smartcase = true
set.linebreak = true
set.numberwidth = 4
set.wrap = false

-- Add a highlight to the current cursor line
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  command = 'highlight link CursorLine CursorColumn',
  pattern = { '*' },
})
