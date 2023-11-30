local opt = vim.opt

vim.cmd [[
	set termguicolors
	set completeopt=menu,menuone,noselect

	" filetype
	filetype on
	filetype plugin on
	filetype indent on

	" set autochdir
	set autoread
	" set colorcolumn=90
	" set splitbelow splitright
	" set wildmenu
	" set wildmode=longest:list,full
	" set laststatus=2
	set showmatch
	set mouse=a
	set showcmd
	set nobackup
	set writebackup
	" set nowrap
	set noshowmode
	set encoding=UTF-8
	set fileencodings=utf8,cp1251,koi8-r,koi8-u
]]

-- column
opt.foldcolumn = "0"
opt.signcolumn = "yes"
opt.colorcolumn = "90"

-- fold
opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = "indent"

-- indention
opt.autoindent = true
opt.expandtab = false
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.smartindent = true

-- linenumber
opt.number = true
opt.relativenumber = false

-- cursor
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guicursor = "a:blinkon100,i-ci:ver150"

-- clipboard
opt.clipboard = "unnamedplus"

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- split
opt.splitbelow = true
opt.splitright = true

-- linewrap
opt.wrap = false
opt.breakindent = true
