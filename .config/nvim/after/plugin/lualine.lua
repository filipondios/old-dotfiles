-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')
local fn = vim.fn

local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return fn.empty(fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = fn.expand('%:p:h')
    local gitdir = fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
lualine.setup({
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal   = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- Left side
    lualine_c = {
      { -- Start
        function()
          return '▊'
        end,
        color = { fg = colors.blue },
        padding = { left = 0, right = 1 },
      },
      { -- mode component
        function()
          return ''
        end,
        color = function()
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[fn.mode()] }
        end,
        padding = { right = 1 }
      },
      { -- Filename component
        'filename',
        cond = nil,
        color = { fg = colors.magenta, gui = 'bold' },
      },
      { -- Cursor location (line:column)
        'location'
      },
      { -- Cursor progress (%)
        'progress',
        color = { fg = colors.fg, gui = 'bold' }
      },
      { -- LPS diagnostics
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
        },
      },
      { -- Middle section
        function()
          return '%='
        end,
      },
      { -- Running LSP
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
      }
    },
    -- Right side
    lualine_x = {
      { -- Git branch
        'branch',
        icon = '',
        color = { fg = colors.violet, gui = 'bold' },
      },
      { -- Git diff
        'diff',
        symbols = {
          added = ' ',
          modified = '󰝤 ',
          removed = ' '
        },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      },
      { -- Bar end
        function()
          return '▊'
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      }
    },
  },
})
