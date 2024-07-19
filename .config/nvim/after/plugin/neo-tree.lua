require("neo-tree").setup({
  close_if_last_window = false,
  enable_git_status = true,
  enable_diagnostics = false,
  indent = {
    indent_size = 2,
    padding = 0
  },
  
  file_size = { enabled = false },
  last_modified = { enabled = false },
  created = { enabled = false },
  symlink_target = { enabled = false },

  expand_all = {
    max_folder_discovery = 300,
    exclude = {},
  },
  
  window = {
    position = "left",
    width = 30,
  },

  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
    cygwin_support = false,
  },

  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = "name",
    highlight_opened_files = "none",
    root_folder_label = ":t",
    full_name = false,
    indent_width = 2,
    highlight_diagnostics = "none",
    highlight_modified = "none",
    highlight_bookmarks = "none",
    highlight_clipboard = "name",
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    }
  }
})
