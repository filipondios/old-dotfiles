-------------------------------
-- Nvim colorscheme settings --
-------------------------------

local status_ok, theme = pcall(require, 'rose-pine')
if not status_ok then
  return
end

-- Astrodark from Astrovim
-- as colorscheme
--[[
astrotheme.setup({
  palette = 'astrodark',
  style = {
    simple_syntax_colors = false,
    italic_comments = false,
    transparent = true,
  }
})
--]]

theme.setup({
  variant = "moon",
  styles = {
    bold = true,
    italic = false,
    transparency = true,
  }
})

-- Other setting and apply changes
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.cmd.colorscheme('astrotheme')
vim.cmd.colorscheme('rose-pine')
