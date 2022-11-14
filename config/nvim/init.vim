syntax on
syntax enable

" vim-plug
call plug#begin()
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'RRethy/vim-illuminate'
	Plug 'numToStr/Comment.nvim'
	Plug 'nvim-treesitter/nvim-treesitter-context'
	Plug 'akinsho/bufferline.nvim'
	Plug 'SmiteshP/nvim-navic'
	Plug 'nvim-tree/nvim-web-devicons'

	" git
	Plug 'tpope/vim-fugitive'
	Plug 'idanarye/vim-merginal'

	" navigation
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'preservim/tagbar'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

	" syntax highlighting
	" polyglot for backup
	Plug 'sheerun/vim-polyglot'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" language support
	Plug 'gregsexton/MatchTag'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'alvan/vim-closetag'
	Plug 'AndrewRadev/tagalong.vim'
	Plug 'dense-analysis/ale'

	" lightweight auto-completion
	" Plug 'maxboisvert/vim-simple-complete'
	" Plug 'ackyshake/VimCompletesMe'

	" auto-completion
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'

	" colorschemes
	Plug 'Rigellute/shades-of-purple.vim'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

" catppuccin colorscheme
	colorscheme catppuccin-mocha


" lua plugin configs
lua << EOF
	-- Comment.nvim
	require('Comment').setup()

	-- nvim-colorizer
	require'colorizer'.setup()

	-- nvim-lsp-installer
	require'nvim-lsp-installer'.setup({
		automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗"
			}
		}
	})

EOF

hi MatchParen cterm=none gui=underline

" tagalong
	let g:tagalong_verbose = 1

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup HANDSOME
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()

	" Terminal
	autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" nvim-treesitter-context
	hi TreesitterContextBottom guibg=#313244
