-- Astrotheme plugin configuration
require("astrotheme").setup({
  palette = "astrodark",
  style = {
     transparent = true,
     border = false,
     italic_comments = false
   }
});

-- Set Astrotheme as colorscheme
vim.cmd.colorscheme('astrodark')
