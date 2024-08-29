-------------------------
-- Custom key mappings --
-------------------------

local map = vim.keymap.set
local function cmd(c)
    return '<Cmd>' .. c .. '<CR>'
end

-- Mode  Keymap       Command         		          Description
map('n', '<A-n>',     cmd('bnext'),   		          { desc = 'Switch to next buffer' })
map('n', '<A-p>',     cmd('bprev'),   		          { desc = 'Switch to previous buffer' })
map('n', '<A-c>',     cmd('bdelete'), 		          { desc = 'Close current buffer' })
map('n', '<A-s>',     cmd('vsplit'),  		          { desc = 'Vertical split one bufer' })
map('n', '<space>ff', cmd('Telescope fd'),	        { desc = 'Find file' })
map('n', '<space>fb', cmd('Telescope buffers'),     { desc = 'Find buffer' })
map('n', '<space>fs', cmd('Telescope grep_string'), { desc = 'Find string in files' })
