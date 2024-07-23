local ensure_packer = function()
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end

return require('packer').startup(function(use)
  use({ 'wbthomason/packer.nvim' })          -- Literaly packer
  use({ 'AstroNvim/astrotheme' })            -- Color theme
  use({ 'lewis6991/gitsigns.nvim' })         -- Git integration
  use({ 'goolord/alpha-nvim' })              -- Dashboard
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Code color

  -- LSP package manager (Mason) 
  use({ 'williamboman/mason.nvim',
    requires = 'williamboman/mason-lspconfig.nvim'
  })

  -- Tabs for each buffer
  use({ 'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  })

  -- Lualine is used for the status line
  use({ 'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  })

  -- File manager inside neovim
  use({ 'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  })

  -- LSP config
  use({ 'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'antosha417/nvim-lsp-file-operations',
    }
  })

  -- LSP improved experience
  use ({ 'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
  })

  -- Code completion
  use({ 'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    }
  })

  -- Everything finder
  use { 'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  if ensure_packer() then
    require('packer').sync()
  end
end)
