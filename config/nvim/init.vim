syntax on
syntax enable

call plug#begin()
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'RRethy/vim-illuminate'
	Plug 'numToStr/Comment.nvim'
	Plug 'nvim-treesitter/nvim-treesitter-context'
	Plug 'akinsho/bufferline.nvim'
	Plug 'SmiteshP/nvim-navic'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'nullchilly/fsread.nvim'
	Plug 'davidgranstrom/nvim-markdown-preview'
	Plug 'manzeloth/live-server'
	Plug 'nvim-lualine/lualine.nvim'

	" git
	Plug 'tpope/vim-fugitive'
	Plug 'idanarye/vim-merginal'
	" Plug 'akinsho/git-conflict.nvim'

	" navigation
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'preservim/tagbar'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'stevearc/aerial.nvim'
	Plug 'gorbit99/codewindow.nvim'
	" Plug 'karb94/neoscroll.nvim'

	" syntax highlighting
	" polyglot for backup
	Plug 'sheerun/vim-polyglot'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" language support
	Plug 'gregsexton/MatchTag'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'AndrewRadev/tagalong.vim'
	Plug 'dense-analysis/ale'
	Plug 'windwp/nvim-ts-autotag'
	" Plug 'm4xshen/autoclose.nvim'

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
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
	Plug 'folke/tokyonight.nvim'
	Plug 'nyoom-engineering/oxocarbon.nvim'
	Plug 'ayu-theme/ayu-vim'
call plug#end()

colorscheme catppuccin-mocha
" colorscheme ayu
" colorscheme oxocarbon
" colorscheme tokyonight-night

" vim-plug


" lua plugin configs
lua << EOF
	local comment_setup, comment = pcall(require, "Comment")
	local colorizer_setup, colorizer = pcall(require, "colorizer")
	local lsp_installer_setup, lsp_installer = pcall(require, "nvim-lsp-installer")

	if not comment_setup or
		not colorizer_setup or
		not lsp_installer_setup then
		return
	end

	-- Comment.nvim
	comment.setup()

	-- nvim-colorizer
	colorizer.setup()

	-- nvim-lsp-installer
	lsp_installer.setup({
		-- automatically detect which servers to install (based on which servers are set up via lspconfig)
		automatic_installation = true,
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

	autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
	autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
	autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
	" autocmd FileType markdown MarkdownPreview
augroup END

" nvim-treesitter-context
hi TreesitterContextBottom guibg=#313244
" hi TreesitterContextBottom gui=underline

" tagbar
let g:tagbar_sort = 0

