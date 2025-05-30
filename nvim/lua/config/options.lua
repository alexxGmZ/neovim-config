local opt = vim.opt

vim.cmd [[
   set termguicolors
   " set completeopt=menu,menuone,noselect
   syntax on

   " filetype
   filetype on
   filetype plugin on
   filetype indent on

   set autoread
   set showmatch
   set mouse=a
   set noshowcmd
   set nobackup
   set writebackup
   set noshowmode
   set encoding=UTF-8
   set fileencodings=utf8,cp1251,koi8-r,koi8-u
]]

-- column
opt.foldcolumn = "0"
opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,90"

-- fold
opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = "indent"

-- indention
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.smartindent = true

-- linenumber
opt.number = false
opt.relativenumber = false

-- cursor
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guicursor = "a:block100-blinkwait900-blinkon200-blinkoff500,i-ci:ver30"

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

-- colorscheme
opt.background = "dark"
