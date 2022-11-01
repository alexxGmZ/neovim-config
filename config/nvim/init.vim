syntax on
syntax enable
set termguicolors

" vim-plug
call plug#begin()
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'preservim/nerdcommenter'
	Plug 'jeffkreeftmeijer/vim-numbertoggle'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'tpope/vim-fugitive'
	Plug 'idanarye/vim-merginal'
	Plug 'RRethy/vim-illuminate'

	" syntax highlighting
	" polyglot for backup
	Plug 'sheerun/vim-polyglot'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/nvim-treesitter-context'

	" language support
	Plug 'gregsexton/MatchTag'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'alvan/vim-closetag'
	Plug 'vim-scripts/c.vim'					"C
	Plug 'https://github.com/AndrewRadev/tagalong.vim.git'
	Plug 'victorvoid/vim-frontend'
	Plug 'dense-analysis/ale'
	Plug 'lighttiger2505/sqls'
	Plug 'preservim/tagbar'

	" lightweight auto-completion
	" Plug 'maxboisvert/vim-simple-complete'
	" Plug 'ackyshake/VimCompletesMe'

	" auto-completion
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	" Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}
	
	" colorschemes
	Plug 'ray-x/aurora'
	Plug 'Rigellute/shades-of-purple.vim'
	Plug 'ghifarit53/daycula-vim'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

set completeopt=menu,menuone,noselect
	
" tokyonight colorscheme
	" let g:tokyonight_style = "night"
	" colorscheme tokyonight

" catppuccin colorscheme
	colorscheme catppuccin-mocha

" lua plugin configs
lua << EOF
	-- nvim-cmp
	local cmp = require'cmp'

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
			  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				-- elseif luasnip.expand_or_locally_jumpable() then
					-- luasnip.expand_or_jump()
				-- elseif jumpable(1) then
					-- luasnip.jump(1)
				--elseif has_words_before() then
				-- cmp.complete()
				--	fallback()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				-- elseif luasnip.jumpable(-1) then
				--	luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'vsnip' }, -- For vsnip users.
			-- { name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require('lspconfig')['pyright'].setup {
		capabilities = capabilities
	}

	-- indent-blankline
	vim.opt.list = true
	vim.opt.termguicolors = true
	vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2c2c2c gui=nocombine]]
	require("indent_blankline").setup {
		space_char_blankline = " ",
		char_highlight_list = {
			"IndentBlanklineIndent1",
		},
	}

	-- lualine
	require('lualine').setup {
		options = {
			icons_enabled = false,
			theme = 'molokai',
			component_separators = { left = '', right = ''},
			component_separators = '',
			section_separators = {
				left = '',
				right = ''
			},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{'mode',
					icons_enabled = true,
					separator = {
						left = '',
						right = ''
					},
				},
			},
			lualine_b = {
				{'filename',
					color = {
						bg = '#c7d158' 
					},
					separator = {
						right = ''
					},
					symbols = {
						modified = '●',
						readonly = '[RO]',
					}
				}
			},
			lualine_c = {
				{'diagnostics',
					color = {
						bg = '#1a1b26',
					},
					sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
					sections = { 'error', 'warn', 'info', 'hint' },
					symbols = {
						error = 'E',
						warn = 'W',
						info = 'I',
						hint = 'H'
					},
					colored = true,
					update_in_insert = false,
					always_visible = false,
					separator = {
						right = ''
					}
				},
			},
			lualine_x = {},
			lualine_y = {'encoding', 'filetype', 'progress'},
			lualine_z = {
				{'location',
					separator = {
						left = '',
						right = ''
					}
				}
			}
		},
		inactive_sections = {
			lualine_a = {
				{'filename',
					color = {
						bg = '#c7d158',
						fg = '#1a1b26'
					},
					separator = {
						left = '',
						right = ''
					},
					symbols = {
						modified = '●',
						readonly = '[RO]',
					},
				}
			},
			lualine_b = {
				{'diagnostics',
					color = {
						bg = '#1a1b26',
					},
					sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
					sections = { 'error', 'warn', 'info', 'hint' },
					symbols = {
						error = 'E',
						warn = 'W',
						info = 'I',
						hint = 'H'
					},
					colored = true,
					update_in_insert = false,
					always_visible = false,
					separator = {
						right = ''
					}
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{'location',
					color = {
						bg = '#66d9ef', 
						fg = '#1a1b26'
					},
					separator = {
						left = '',
						right = ''
					},
				}
			}
		},
		tabline = {
			lualine_a = {
				{'branch',
					color = {
						bg = '#f92672',
						fg = '#f7f5f5'
					},
					separator = {
						left = '',
						right = ''
					},
					icons_enabled = true,
				},
			},
			lualine_b = {
				{'diff',
					colored = true,
					color = {
						bg = '#1a1b26',
					},
					diff_color = {
						added = {
							fg = '#9ece6a',
						},
						modified = {
							fg = '#7dcfff',
						},
						removed = {
							fg = '#f7768e',
						},
					},
					symbols = {
						added = '+',
						modified = '~',
						removed = '-',
					},
					separator = {
						right = ''
					},
					source = nil,
				},
			},
			lualine_c = {
				{'filename',
					color = {
						bg = '#c7d158',
						fg = '#2c2c2c'
					},
					path = 1,
					shorting_target = 0,
					separator = {
						left = '',
						right = ''
					},
					symbols = {
						modified = '●',
						readonly = '[RO]',
					}
				}
			},
			lualine_z = {
				{'tabs',
					mode = 0,
					separator = {
						left = '',
						right = ''
					},
				},
			}
		},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}

	-- treesitter
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "lua", "rust" },
		sync_install = false,
		auto_install = true,
		ignore_install = { "javascript" },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
EOF

" NERD Commenter
	let g:NERDCreateDefaultMappings = 1
	let g:NERDSpaceDelims = 1
	let g:NERDCompactSexyComs = 1
	let g:NERDDefaultAlign = 'left'
	let g:NERDAltDelims_java = 1
	let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
	let g:NERDCommentEmptyLines = 1
	let g:NERDTrimTrailingWhitespace = 1
	let g:NERDToggleCheckAllLines = 1

" fzf
	nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

" vim-illuminate
	hi link IlluminatedWordText Visual
	hi link IlluminatedWordRead Visual
	hi link IlluminatedWordWrite Visual

" closetag
	let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
	let g:closetag_filetypes = 'html,xhtml,phtml,php'
	let g:closetag_emptyTags_caseSensitive = 1
	let g:closetag_shorcut = '>'
	let g:closetag_close_shortcut = '<leader>>'

" ALE
	nmap ]a :ALENextWrap<CR>
	nmap [a :ALEPreviousWrap<CR>
	nmap ]A :ALELast<CR>
	nmap [A :ALEFirst<CR>

" Terminal
	autocmd TermOpen * setlocal nonumber norelativenumber
	tnoremap <Esc> <C-\><C-n> 

" nvim-treesitter-context
	hi TreesitterContextBottom gui=underline guisp=Grey

" lightline
	let g:lightline = {'colorscheme' : 'shades_of_purple'}

" nerdtree toggle
	nmap <F6> :NERDTreeToggle<CR>

" tagbar toggle
	nmap <F8> :TagbarToggle<CR>

" nvim-colorizer
	lua require'colorizer'.setup()

" Remove Search Highlight
	map <esc> :noh <CR>

" auto-complete brackets
	inoremap { {}<Esc>ha
	inoremap ( ()<Esc>ha
	inoremap [ []<Esc>ha
	inoremap " ""<Esc>ha
	inoremap ' ''<Esc>ha

" indention
	set autoindent
	set noexpandtab
	set tabstop=3
	set softtabstop=3
	set shiftwidth=3

" filetype
	filetype on
	filetype plugin on
	filetype indent on

" line number
	set relativenumber
	set number
	set cursorline
	set scrolloff=5

" search
	set hlsearch
	set incsearch
	set ignorecase
	set smartcase

set colorcolumn=90
set complete-=t " exclude tags
set nocompatible
set ttyfast
set wildmenu
set wildmode=longest:list,full
set laststatus=2
set showmatch
set mouse=a
set showcmd
set nobackup
set writebackup
set nowrap
set noshowmode
set encoding=UTF-8
set fileencodings=utf8,cp1251,koi8-r,koi8-u
