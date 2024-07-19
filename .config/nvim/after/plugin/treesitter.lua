require('nvim-treesitter.configs').setup ({
  ensure_installed = { 
    "c",
    'lua',
    'markdown',
    'rust',
    'cpp'
  },

  sync_install = false,
  auto_install = true,
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
