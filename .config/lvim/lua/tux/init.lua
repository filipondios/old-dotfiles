require("tux.dashboard")
require("tux.plugins")

require("astrotheme").setup({
  palette = "astrodark",

  style = {
    transparent = true,
    border = false,
    italic_comments = false
  }
});

-- lvim.colorscheme = "halcyon"
-- lvim.colorscheme = "vscode"
-- lvim.colorscheme = "gruvbox"
-- lvim.colorscheme = "onedark"
lvim.colorscheme = "astrotheme"
-- lvim.colorscheme = "moonfly"
-- lvim.colorscheme = "aquarium"
-- lvim.colorscheme = "bubblegum-256-dark"

-- Settings
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
