---------------------------------------
-- Telescope (fuzzy finder) settings --
---------------------------------------

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

-- Add some extensions to telescope
pcall(telescope.load_extension, 'ui-select')       -- Enhances Telescope UI pickers
local previewers = require('telescope.previewers') -- Search previewers

telescope.setup({
  defaults = {
    layout_config = { vertical = { width = 0.8, height = 0.6 } },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
	  file_previewer = previewers.vim_buffer_cat.new,
	  grep_previewer = previewers.vim_buffer_vimgrep.new,
	  qflist_previewer = previewers.vim_buffer_qflist.new,
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    selection_caret = '  ',
    prompt_prefix = ' ',
    entry_prefix = '  '
  }
})
