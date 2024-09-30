---------------------------------------
-- Nvim commands completion settings --
--------------------------------------

local status_ok, command_completion = pcall(require, 'command-completion')
if not status_ok then
  return
end

command_completion.setup({
  border = 'single',
  max_col_num = 5,
  min_col_width = 5,
  tab_completion = true,
})
