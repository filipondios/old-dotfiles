-- Bufferline plugin configuration
-- Adds 'tabs' at the top of the window, showing the 
-- open buffers.
local bufferline = require("bufferline")
bufferline.setup {
  options = {
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    separator_style = 'thick',
    always_show_bufferline = true,
    hover = { enabled = false }
  }
}
