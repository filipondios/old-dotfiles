-------------------------
-- Nvim basic settings --
-------------------------

local set = vim.opt
set.history=20  		        -- Keep 20 lines of command line history
set.ruler=true			        -- Show the cursor position all the time
set.showcmd=true            -- Display incomplete commands
set.wildmenu=true           -- Display completion matches
set.scrolloff=5 		        -- Show a few lines around the cursor
set.backup=false		        -- Do not keep a backup file, use versions instead
set.undofile=true		  	    -- Keep an undo file (undo changes after closing)
set.hlsearch=true 		  	  -- Switch on highlighting the last used search pattern
set.wrap=false 			        -- Long lines don't wrap
set.number=true	   			    -- Show the number for each line
set.relativenumber=true     -- Show the line number relative to the cursor's line
set.numberwidth=4 	        -- Number of columns to use for the line number
set.undoreload=1000	        -- Maximum number of lines to save for undo
set.tabstop=4		            -- Number of spaces a <Tab> in the text stands for
set.softtabstop=4           -- Number of spaces a <Tab> counts while editing 
set.shiftwidth=4	          -- Number of spaces for each step of (auto)indent
set.expandtab = true        -- Convert tabs to spaces
set.smartindent=true	      -- Do clever autoindenting
set.writebackup=false       -- Do not write a backup file before overriting a file
set.swapfile=false          -- Do not use a swap file for a buffer
set.clipboard='unnamedplus' -- Clipboard
set.colorcolumn="80"

-- Completion options
set.completeopt={'menu','menuone','noselect'}
set.shortmess:append 'c'

-- Add a highlight to the current cursor line
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  command = 'highlight link CursorLine CursorColumn',
  pattern = { '*' },
})
