-----------------------
-- Nvim plugins list --
-----------------------

local ensure_packer = function()
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
        vim.cmd('packadd packer.nvim')
        return true
    end
    return false
end

return require('packer').startup(function(use)
    -- Packer (the package manager)
    use({ 'wbthomason/packer.nvim' })
    -- Git integration in nvim
    use({ 'lewis6991/gitsigns.nvim' })
    -- Blank buffer dashboard
    use({ 'goolord/alpha-nvim' })
    -- Code color highlighting
    use({ 'nvim-treesitter/nvim-treesitter' })
    -- Color theme (from astrovim)
    use({ 'AstroNvim/astrotheme' })
    -- Command ':' completion
    use({ 'smolck/command-completion.nvim' })
    -- Show indentation lines
    use({ 'lukas-reineke/indent-blankline.nvim' })

    -- Status line (live editor info)
	  use({ 'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }})

    -- use({ 'tjdevries/express_line.nvim',
    -- requires = { 'nvim-lua/plenary.nvim' }})

    -- Telescope (fuzzy finder)
    use ({ 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }})

    -- Code completion
	use({ 'hrsh7th/nvim-cmp',
		requires = {
      'onsails/lspkind.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      { 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' },
      'saadparwaiz1/cmp_luasnip',
		}
	})

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
