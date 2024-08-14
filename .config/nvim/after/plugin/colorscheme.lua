-- Set colorscheme

--[[
vim.cmd.colorscheme('gruvbuddy')
local colorbuddy = require('colorbuddy')
colorbuddy.colorscheme("gruvbuddy")

local Color = colorbuddy.Color
local Group = colorbuddy.Group
local c = colorbuddy.colors
local s = colorbuddy.styles

Color.new("violet", "#b294bb")
Color.new("gray", "#b0b1b0")
Group.new('Comment', c.gray,  c.none,  s.none)
Group.new("@keyword", c.violet, nil, s.bold)

local function disable_italics()
  vim.cmd('highlight Comment cterm=NONE gui=NONE')
  vim.cmd('highlight Italic cterm=NONE gui=NONE')
end

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = disable_italics,
})
--]]


--[[
require("astrotheme").setup({
  palette = "astrodark",
  style = {
		transparent = true,
    italic_comments = false,
    simple_syntax_colors = false,
  }
})
--]]


require("rose-pine").setup({
    variant = "moon", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    styles = {
        bold = true,
        italic = false,
        transparency = true,
    },
})


-- setup must be called before loading
-- vim.cmd.colorscheme('astrodark')
-- vim.cmd.colorscheme('gruvbuddy')
vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
