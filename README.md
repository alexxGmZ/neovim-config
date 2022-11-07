# My Neovim Configs

### Screenshots

![image1](./assets/images/img1.png)
![image2](./assets/images/img2.png)
![image3](./assets/images/img3.png)
![image4](./assets/images/img4.png)

### Tools I use or need

* Fedora 36 OS
* zsh (oh-my-zsh)
* Kitty Terminal (coz it supports font ligature and other utf-8 symbols)
* npm
* pyright (for python LSP)
* clang (for clangd LSP)
* java-devel (for jdtls LSP)
* ctags (for tagbar to work)
* go (for sqls LSP)
* lua (for sumneko_lua LSP)
* composer (for phpactor LSP)
* neovim v0.8.0
* vim-plug
* Tabs is better than Spaces

<br>

### Plugins

I use ```vim-plug``` as a Plugin Manager

#### Navigation

* scrooloose/nerdtree
* junegunn/fzf
* ibhagwan/fzf-lua
* preservim/tagbar
* christoomey/vim-tmux-navigator
* jeffkreeftmeijer/vim-numbertoggle
* nvim-lua/plenary.nvim
* nvim-telescope/telescope.nvim

#### Syntax Highlighting

* sheerun/vim-polyglot
* nvim-treesitter/nvim-treesitter

#### Auto-Completion

* gregsexton/MatchTag
* vim-scripts/c.vim
* AndrewRadev/tagalong.vim.git
* neovim/nvim-lspconfig
* williamboman/nvim-lsp-installer
* hrsh7th/cmp-nvim-lsp
* hrsh7th/cmp-buffer
* hrsh7th/cmp-path
* hrsh7th/cmp-cmdline
* hrsh7th/nvim-cmp
* hrsh7th/cmp-vsnip
* hrsh7th/vim-vsnip

Lightweight Alternatives:
* maxboisvert/vim-simple-complete
* ackyshake/VimCompletesMe

#### Aesthetic or UI

* lukas-reineke/indent-blankline.nvim
* nvim-lualine/lualine.nvim
* ghifarit53/tokyonight-vim
* catppuccin/nvim
* Rigellute/shades-of-purple.vim
* ghifarit53/tokyonight-vim
* RRethy/vim-illuminate
* akinsho/bufferline.nvim

#### Quality of Life

* tpope/vim-fugitive
* idanarye/vim-merginal
* norcalli/nvim-colorizer.lua
* alvan/vim-closetag
* dense-analysis/ale
* nvim-treesitter/nvim-treesitter-context
* numToStr/Comment.nvim

<br>

### Plugin Configs

* [nvim-cmp](#nvim-cmp)
* [lspconfig](#lspconfig)
* [nvim-lsp-installer](#nvim-lsp-installer)
* [indent-blankline](#indent-blankline)
* [lualine](#lualine)
* [nvim-treesitter](#nvim-treesitter)
* [telescope](#telescope)
* [bufferline](#bufferline)
* [Comment](#Comment)
* [fzf-lua](#fzf-lua)
* [vim-illuminate](#vim-illuminate)
* [vim-closetag](#vim-closetag)
* [ale](#ale)
* [lightline](#lightline)
* [nerdtree](#nerdtree)
* [tagbar](#tagbar)
* [nvim-colorizer](#nvim-colorizer)

<br>

#### nvim-cmp

```lua
-- lua
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
```

#### lspconfig

```lua
-- lua
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}

require('lspconfig')['jdtls'].setup{
	capabilities = capabilities
}

require('lspconfig')['html'].setup{
	capabilities = capabilities
}

require('lspconfig')['clangd'].setup{
	capabilities = capabilities
}

require('lspconfig')['sumneko_lua'].setup{
	capabilities = capabilities
}

require('lspconfig')['intelephense'].setup{
	capabilities = capabilities
}

require('lspconfig')['vimls'].setup{
	capabilities = capabilities
}

require('lspconfig')['sqls'].setup{
	capabilities = capabilities
}

require('lspconfig')['phpactor'].setup{
	capabilities = capabilities,
}
```

#### nvim-lsp-installer

```lua
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
```

#### indent-blankline

```lua
-- lua
vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2c2c2c gui=nocombine]]
require("indent_blankline").setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
}
```

#### lualine

```lua
-- lua
require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'molokai',
		-- component_separators = { left = '', right = ''},
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
		lualine_b = {
			{'filename',
				color = {
					bg = '#c7d158'
				},
				path = 1,
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
	-- tabline = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = {},
	-- 	lualine_z = {
	-- 		{'tabs',
	-- 			mode = 0,
	-- 			separator = {
	-- 				left = '',
	-- 				right = ''
	-- 			},
	-- 		},
	-- 	}
	-- },
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
```

#### nvim-treesitter

```lua
-- lua
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
```

#### telescope
```lua
-- lua
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

-- builtin keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-s>"] = actions.select_horizontal,
			}
		},
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				height = 0.9,
				prompt_position = 'bottom',
				width = 0.9,
				preview_cutoff = 10
			}
		}
	}
}
```

#### bufferline

```lua
-- lua
require('bufferline').setup {
	options = {
		mode = "tabs",
		truncate_names = false,
		name_formatter = function(buf)
			--- truncate backwards
			-- buf.path = string.gsub(buf.path, "/home/al6x/", "~/")
			-- local tab_name_length = #buf.path
			-- local max_name_length = 35
			-- if tab_name_length > max_name_length then
			-- 	buf.path = string.sub(buf.path, tab_name_length - max_name_length, tab_name_length)
			-- 	buf.path = "..." .. buf.path
			-- end
			-- return buf.path
			return buf.name
		end,
		numbers = "ordinal",
		indicator = {
			style = "none"
		},
		separator_style = "slant",
		diagnostics = "nvim_lsp"
	}
}
```

#### Comment

```lua
-- lua
require('Comment').setup()
```

#### fzf-lua

```vim
" vim-script
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
```

#### vim-illuminate

```vim
" vim-script
hi link IlluminatedWordText Visual
hi link IlluminatedWordRead Visual
hi link IlluminatedWordWrite Visual
```

#### vim-closetag

```vim
" vim-script
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
let g:closetag_filetypes = 'html,xhtml,phtml,php'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shorcut = '>'
let g:closetag_close_shortcut = '<leader>>'
```

#### ale

```vim
" vim-script
nmap ]a :ALENextWrap<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]A :ALELast<CR>
nmap [A :ALEFirst<CR>
```

#### lightline

```vim
" vim-script
let g:lightline = {'colorscheme' : 'shades_of_purple'}
```

#### nerdtree

```vim
" vim-script
nmap <F6> :NERDTreeToggle<CR>
```

#### tagbar

```vim
" vim-script
nmap <F8> :TagbarToggle<CR>
```

#### nvim-colorizer

```vim
" vim-script
lua require'colorizer'.setup()
```

<br>
