require("user.dashboard")
require("user.plugins")

-- Setup
require'colorizer'.setup()
require('live-server').setup()

-- Color theme
lvim.colorscheme = "halcyon"

-- Settings
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
