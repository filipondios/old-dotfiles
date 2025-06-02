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
    -- General plugins (theme, ui, file search)
    use({ 'wbthomason/packer.nvim' })
    use({ 'lewis6991/gitsigns.nvim' })
    use({ 'goolord/alpha-nvim' })
    use({ 'nvim-treesitter/nvim-treesitter' })
    use({ 'AstroNvim/astrotheme' })
    use({ 'smolck/command-completion.nvim' })
    use({ 'lukas-reineke/indent-blankline.nvim' })
    use({ 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' }})
    use ({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }})

    -- Code completion (CMP)
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
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
    }
  })

  if ensure_packer() then
    require('packer').sync()
  end
end)
