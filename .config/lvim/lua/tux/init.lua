require("tux.dashboard")
require("tux.plugins")

-- Color theme
-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    -- transparent = true,

    -- Enable italic comment
    -- italic_comments = false,

    -- Underline `@markup.link.*` variants
    -- underline_links = true,

    -- Disable nvim-tree background color
    -- disable_nvimtree_bg = false,
-- })
-- require('vscode').load()

-- lvim.colorscheme = "halcyon"
-- lvim.colorscheme = "vscode"
lvim.colorscheme = "gruvbox"

-- Settings
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
