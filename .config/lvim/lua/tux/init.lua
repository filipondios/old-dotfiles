require("tux.dashboard")
require("tux.plugins")
require("tux.mappings")

-- Color scheme
lvim.colorscheme = "astrotheme"
require("astrotheme").setup({
  palette = "astrodark",
  style = {
     transparent = true,
     border = false,
     italic_comments = false
   }
});

-- Settings
vim.opt.formatoptions:append('t')
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.title = true
vim.opt.autoindent = false
vim.opt.ruler = true
vim.opt.showmode = true
vim.opt.splitbelow = true
vim.opt.modeline = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.formatoptions = 'tcqro2'
vim.opt.smartindent = true
vim.opt.laststatus = 2
vim.opt.modeline = false
vim.opt.softtabstop = 2
vim.opt.showtabline = 1
vim.opt.sidescroll = 5
vim.opt.scrolloff = 4
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.foldmethod = 'marker'
vim.opt.ttyfast = true
vim.opt.history = 10000
vim.opt.hidden = true
vim.opt.colorcolumn = '81'
vim.opt.number = true
vim.opt.swapfile = false
vim.opt.foldlevelstart = 0
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.conceallevel = 2
