local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-n>', '<Cmd>BufferLineCycleNext<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferLineCyclePrev<CR>', opts)
