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
  use({ 'lewis6991/gitsigns.nvim' })         -- Git integration
  use({ 'goolord/alpha-nvim' })              -- Dashboard
  use({ 'nvim-treesitter/nvim-treesitter' }) -- Code color

  -- Color Themes 
  use({ 'tjdevries/colorbuddy.nvim' })
	use({ 'AstroNvim/astrotheme' })
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Tabs for each buffer
  use({ 'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  })

  -- Status line (live editor info)
	use({ 'tjdevries/express_line.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  })

  -- Code completion
	use({ 'hrsh7th/nvim-cmp',
		requires = {
			"onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", run = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
		}
	})

  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {
			'nvim-lua/plenary.nvim',
			'kkharji/sqlite.lua',
			'nvim-telescope/telescope-ui-select.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
		}
	}

  -- Language Servers (LSP) 
  use({ 'nvimdev/lspsaga.nvim',
    requires = {
			'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'antosha417/nvim-lsp-file-operations',
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		}
  })

  if ensure_packer() then
    require('packer').sync()
  end
end)
