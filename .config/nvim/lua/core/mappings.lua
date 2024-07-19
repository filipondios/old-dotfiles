local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- All custom key mappings definition
--  mode   keys              command                       description
map('n', '<A-n>', '<cmd>BufferLineCycleNext<cr>',  { desc = 'Move to next buffer' })
map('n', '<A-p>', '<cmd>BufferLineCyclePrev<cr>',  { desc = 'Move to previous buffer' })
map('n', '<A-l>', '<cmd>BufferLineCloseLeft<cr>',  { desc = 'Close left buffer' })
map('n', '<A-r>', '<cmd>BufferLineCloseRight<cr>', { desc = 'Close right buffer' })
map('n', '<A-e>', '<cmd>Neotree toggle<cr>',       { desc = 'Open/close neotree' })
