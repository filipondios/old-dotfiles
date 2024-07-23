local status_ok, astrotheme = pcall(require, "astrotheme")
if not status_ok then
  return
end

astrotheme.setup({
  palette = "astrodark",
  style = {
     transparent = true,
     border = false,
     italic_comments = false
   }
});

-- Set Astrotheme as colorscheme
vim.cmd.colorscheme('astrodark')
