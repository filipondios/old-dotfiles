local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local data = assert(vim.fn.stdpath "data") --[[@as string]]

telescope.setup({
  extensions = {
    wrap_results = true,
    fzf = {},
    history = {
      path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
      limit = 100,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
})

-- Add some extensions to telescope
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

-- Add custom keymaps:
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<space>fd", builtin.find_files)
vim.keymap.set("n", "<space>ft", builtin.git_files)
vim.keymap.set("n", "<space>fh", builtin.help_tags)
vim.keymap.set("n", "<space>fg", builtin.live_grep)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>gw", builtin.grep_string)
