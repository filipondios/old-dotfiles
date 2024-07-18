local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  -- Plugins are defined here
  use { 'AstroNvim/astrotheme' }
  use { 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
  use { 'lewis6991/gitsigns.nvim', }
  use { 'goolord/alpha-nvim', requires = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim' }}

  if ensure_packer() then
    require('packer').sync()
  end
end)
