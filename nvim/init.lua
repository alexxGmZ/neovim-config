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

local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

require("lazy").setup({
	-- #### COLORSCHEME #### --
	-- catppuccin
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

	-- moonfly
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.moonfly")
		end
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.tokyonight")
		end
	},

	-- github
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.github-theme")
		end,
	},

	-- rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("alex.plugins.rose-pine")
		end,
	},

	-- newpaper
	{
		"yorik1984/newpaper.nvim",
		lazy = false,
		priority = 1000,
	},
	-- #### COLORSCHEME #### --


	-- #### LOAD BY COMMAND #### --
	{
		"barrett-ruth/live-server.nvim",
		config = true,
		cmd = {"LiveServerStart"}
	},
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		config = function ()
			require("alex.plugins.oil")
		end
	},

	{
		"aca/marp.nvim",
		config = function ()
			require("alex.plugins.marp")
		end,
		cmd = "MarpStart"
	},
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		dependencies = {
			"junegunn/fzf"
		}
	},

	{
		"folke/twilight.nvim",
		opts = {
			context = 11,
			treesitter = false,
		},
		cmd = {"Twilight", "TwilightEnable"}
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
		cond = if_git_dir,
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
		"f-person/git-blame.nvim",
		config = function()
			require("alex.plugins.git-blame")
		end,
		cmd = {"GitBlameToggle", "GitBlameEnable"},
		cond = if_git_dir
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
		cond = if_git_dir
	},
	-- #### LOAD IN GIT DIRECTORY #### --


	-- #### LOAD IN VeryLazy EVENT #### --
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		config = function()
			require("alex.plugins.diagflow")
		end
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},

	{
		"m4xshen/autoclose.nvim",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.autoclose")
		end,
	},
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
			"lukas-reineke/cmp-under-comparator",
			"f3fora/cmp-spell",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets"
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
		"uga-rosa/ccc.nvim",
		config = function()
			require("alex.plugins.ccc")
		end
	},

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
})
