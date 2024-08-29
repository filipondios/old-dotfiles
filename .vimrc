if &compatible
  " Vim settings
  set nocompatible
endif

silent! while 0
  set nocompatible
silent! endwhile

" Add optional packages.
if has('syntax') && has('eval')
	packadd! matchit
endif

set history=20  		" Keep 20 lines of command line history
set ruler						" Show the cursor position all the time
set showcmd     		" Display incomplete commands
set wildmenu    		" Display completion matches
set scrolloff=5 		" Show a few lines around the cursor

set nobackup		  	" Do not keep a backup file, use versions instead
set undofile		  	" Keep an undo file (undo changes after closing)
set hlsearch 		  	" Switch on highlighting the last used search pattern

set nowrap 			  	" Long lines don't wrap
set number	   			" Show the number for each line
set relativenumber  " Show the line number relative to the cursor's line
set numberwidth=4 	" Number of columns to use for the line number
set undoreload=1000	" Maximum number of lines to save for undo
set tabstop=2		    " Number of spaces a <Tab> in the text stands for
set softtabstop=2   " Number of spaces a <Tab> counts while editing 
set shiftwidth=2	  " Number of spaces for each step of (auto)indent
set smartindent	    " Do clever autoindenting
set nowritebackup   " Do not write a backup file before overriting a file
set noswapfile      " Do not use a swap file for a buffer

" Other  settings
colorscheme habamax
filetype plugin indent on
set termguicolors
syntax on

" Plugins
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'rust-lang/rust.vim'
call plug#end()

" Key mappings
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :FZF<CR>
nnoremap <C-r> :Rg<CR>
