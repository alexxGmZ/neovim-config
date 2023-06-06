vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("alex.core.autocmds")
require("alex.core.keymaps")
require("alex.core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- #### COLORSCHEME #### --
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("alex.plugins.catppuccin")
			vim.cmd.colorscheme "catppuccin"
		end
	},

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme "moonfly"
		end
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.tokyonight")
			-- vim.cmd.colorscheme "tokyonight"
		end
	},

	{
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.github-theme")
			-- vim.cmd('colorscheme github_dark')
		end,
	},
	-- #### COLORSCHEME #### --


	-- #### LOAD BY COMMAND #### --
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		dependencies = {
			"junegunn/fzf"
		}
	},

	{
		"folke/trouble.nvim",
		config = function ()
			require("alex.plugins.trouble")
		end,
		cmd = {"Trouble", "TroubleToggle"},
	},

	{
		"is0n/jaq-nvim",
		config = function ()
			require("alex.plugins.jaq-nvim")
		end,
		cmd = {"Jaq"}
	},

	{
		"nullchilly/fsread.nvim",
		cmd = {'FSRead', 'FSToggle'}
	},

	{
		"manzeloth/live-server",
		cmd = {'LiveServer'}
	},

	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("alex.plugins.symbols-outline")
		end,
		cmd = {'SymbolsOutline', 'SymbolsOutlineOpen'},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		}
	},

	{
		"gorbit99/codewindow.nvim",
		config = function()
			require("alex.plugins.codewindow")
		end,
		cmd = {'CWToggle', 'CWOpen'}
	},

	{
		"idanarye/vim-merginal",
		dependencies = {
			"tpope/vim-fugitive",
		},
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
		cmd = {'Merginal', 'MerginalToggle', 'Git'}
	},
	-- #### LOAD BY COMMAND #### --


	-- #### LOAD BY FILETYPE #### --
	{
		"davidgranstrom/nvim-markdown-preview",
		ft = "markdown",
	},

	{
		"mtdl9/vim-log-highlighting",
		ft = {'log'}
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {'markdown', 'html', 'php', 'xml', 'javascript'},
		dependencies = {
			"AndrewRadev/tagalong.vim",
			"gregsexton/MatchTag",
			"nvim-treesitter/nvim-treesitter",
		}
	},
	-- #### LOAD BY FILETYPE #### --


	-- #### LOAD IN GIT DIRECTORY #### --
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
	},
	-- #### LOAD IN GIT DIRECTORY #### --


	-- #### LOAD IN VeryLazy EVENT #### --
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"lukas-reineke/cmp-under-comparator"
		},
		config = function ()
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.lualine")
		end,
		dependencies = {
			"SmiteshP/nvim-navic"
		}
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.bufferline")
		end
	},

	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.vim-illuminate")
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			-- require("alex.plugins.indent-blankline")
		end,
	},

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function ()
			require("Comment").setup()
		end
	},

	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end
	},

	{
		"Bekaboo/deadcolumn.nvim",
		event = "VeryLazy",
		config = function ()
			require("deadcolumn").setup({
				warning = {
					alpha = 0.3,
					colorcode = "#F38BA8",
				}
			})
		end,
	},

	{
		"chrisgrieser/nvim-early-retirement",
		event = "VeryLazy",
		config = function ()
			require("alex.plugins.early-retirement")
		end,
	},

	{
		"sitiom/nvim-numbertoggle",
		event = "VeryLazy",
	},

	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.nvim-tmux-navigation")
		end
	},
	-- #### LOAD IN VeryLazy EVENT #### --


	{
		"rcarriga/nvim-notify",
		priority = 999,
		config = function ()
			require("alex.plugins.notify")
		end
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("alex.plugins.nvim-tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		}
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("alex.plugins.treesitter")
			require("alex.plugins.treesitter-context")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context"
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"SmiteshP/nvim-navic",
			-- "ray-x/lsp_signature.nvim"
		},
		config = function()
			require("alex.plugins.lsp.mason")
			require("alex.plugins.lsp.lspconfig")
		end
	},

	{
		"NMAC427/guess-indent.nvim",
		config = function ()
			require("guess-indent").setup{}
		end,
	},

	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		config = function ()
			require("alex.plugins.oil")
		end
	}

})
