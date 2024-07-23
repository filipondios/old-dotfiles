local status_ok, telescope = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

telescope.setup()
