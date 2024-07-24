local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local lspkind = require('lspkind')
lspkind.init({})

-- Completion function
local function cmp_complete()
  if cmp.visible() then
    cmp.abort()
  else
    cmp.complete()
  end
end

-- Go to next suggestion with tab
local function cmp_tab(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else fallback() end
end

-- Completion format
local function cmp_format(entry, vim_item)
  local icons = {
    Class = "",
    Color = "󰏘",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "󰉋",
    Function = "󰊕",
    Interface = "",
    Keyword = "󰌋",
    Method = "",
    Misc = " ",
    Module = "",
    Operator = "󰆕",
    Property = "",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "󰉿",
    TypeParameter = "",
    Unit = "󰑭",
    Value = "",
    Variable = "",
  }

  vim_item.kind = string.format("%s", icons[vim_item.kind])
  vim_item.menu = ({
    nvim_lsp = "[LSP]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
    spell = "[Spell]",
    tags = "[Tags]",
    treesitter = "[TS]",
  })[entry.source.name]
  return vim_item
end

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "cody" },
    { name = "path" },
    { name = "buffer" },
  },
  mapping = {
		['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Up>']   = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ["<CR>"]   = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping({ i = cmp_complete, c = cmp_complete }),
    -- ["<Tab>"] = cmp.mapping(cmp_tab, {'i', 'c', 's' }),
	},
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
	confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
	completion = {
    completeopt = 'menu,menuone,noinsert'
  },
	formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = cmp_format
  },
	window = {
    completion = {
      border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
      side_padding = 2
    },
    documentation = {
      border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
      side_padding = 2,
    }
  },
}
