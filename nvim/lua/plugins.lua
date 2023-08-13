local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	--
	-- #### COLORSCHEME #### --
	--
	-- catppuccin (main colorscheme)
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
		-- lazy = false,
		-- priority = 1000,
		-- event = "VeryLazy",
		event = "CmdlineEnter",
		config = function()
			require("alex.plugins.moonfly")
		end
	},

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- event = "VeryLazy",
		event = "CmdlineEnter",
		config = function()
			require("alex.plugins.tokyonight")
		end
	},

	-- github
	{
		"projekt0n/github-nvim-theme",
		-- lazy = false,
		-- priority = 1000,
		-- event = "VeryLazy",
		event = "CmdlineEnter",
		config = function()
			require("alex.plugins.github-theme")
		end,
	},

	-- rose pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- lazy = false,
		-- priority = 1000,
		-- event = "VeryLazy",
		event = "CmdlineEnter",
		config = function()
			require("alex.plugins.rose-pine")
		end,
	},

	-- newpaper
	{
		"yorik1984/newpaper.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- event = "VeryLazy",
		event = "CmdlineEnter",
	},
	-- #### COLORSCHEME #### --


	--
	-- #### LOAD BY COMMAND #### --
	--
	{
		"f3fora/cmp-spell",
		config = function()
			require("alex.plugins.lsp.cmp-spell")
		end,
		cmd = { "Spell", "SpellToggle" }
	},

	{
		"VidocqH/lsp-lens.nvim",
		event = "LspAttach",
		config = function()
			require("lsp-lens").setup({})
			vim.cmd("LspLensOff")
		end,
		-- cmd = { "LspLensOn", "LspLensToggle" }

	},

	{
		"barrett-ruth/live-server.nvim",
		config = true,
		cmd = { "LiveServerStart" }
	},

	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		config = function()
			require("alex.plugins.oil")
		end
	},

	{
		"aca/marp.nvim",
		config = function()
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
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "Twilight", "TwilightEnable" }
	},

	{
		"folke/trouble.nvim",
		event = "LspAttach",
		cmd = { "Trouble", "TroubleToggle" },
		config = function()
			require("alex.plugins.trouble")
		end,
	},

	{
		"is0n/jaq-nvim",
		config = function()
			require("alex.plugins.jaq-nvim")
		end,
		cmd = { "Jaq" }
	},

	{
		"nullchilly/fsread.nvim",
		cmd = { "FSRead", "FSToggle" }
	},

	{
		"simrat39/symbols-outline.nvim",
		event = "LspAttach",
		config = function()
			require("alex.plugins.symbols-outline")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		}
	},

	{
		"gorbit99/codewindow.nvim",
		config = function()
			require("alex.plugins.codewindow")
		end,
		cmd = { 'CWToggle', 'CWOpen' }
	},

	-- #### LOAD BY COMMAND #### --


	--
	-- #### LOAD BY FILETYPE #### --
	--
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("alex.plugins.ccc")
		end,
		ft = { "markdown", "html", "php", "javascript", "css" }
	},

	{
		"davidgranstrom/nvim-markdown-preview",
		ft = "markdown",
	},

	{
		"mtdl9/vim-log-highlighting",
		ft = "log"
	},

	{
		"windwp/nvim-ts-autotag",
		ft = { 'markdown', 'html', 'php', 'xml', 'javascript' },
		dependencies = {
			"AndrewRadev/tagalong.vim",
			"gregsexton/MatchTag",
			"nvim-treesitter/nvim-treesitter",
		}
	},
	-- #### LOAD BY FILETYPE #### --


	--
	-- #### LOAD IN GIT DIRECTORY #### --
	--
	{
		"f-person/git-blame.nvim",
		cond = if_git_dir,
		config = function()
			require("alex.plugins.git-blame")
		end,
		cmd = { "GitBlameToggle", "GitBlameEnable" }
	},

	{
		"lewis6991/gitsigns.nvim",
		cond = if_git_dir,
		config = function()
			require("gitsigns").setup()
		end
	},

	{
		"idanarye/vim-merginal",
		cond = if_git_dir,
		cmd = { "Merginal", "MerginalToggle", "Git" },
		dependencies = {
			"tpope/vim-fugitive",
		}
	},
	-- #### LOAD IN GIT DIRECTORY #### --


	--
	-- #### LOAD IN VeryLazy EVENT #### --
	--
	{
		"neovim/nvim-lspconfig",
		event = {
			"InsertCharPre",
			"TabNew",
			"TabEnter",
		},
		cmd = {
			"LspStart",
			"Trouble",
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/trouble.nvim",
			"ibhagwan/fzf-lua",
			"simrat39/symbols-outline.nvim",
		},
		config = function()
			require("alex.plugins.lsp.mason")
			require("alex.plugins.lsp.lspconfig")
			vim.cmd("LspStart")
		end,
	},

	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		config = function()
			require("alex.plugins.diagflow")
		end
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},

	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
		config = function()
			require("alex.plugins.autoclose")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = {
			"CmdlineEnter",
			"InsertEnter"
		},
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
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.lualine")
		end,
	},

	{
		"chrisgrieser/nvim-dr-lsp",
		event = "LspAttach"
	},

	{
		"akinsho/bufferline.nvim",
		-- event = "VeryLazy",
		event = {
			"TabNew",
			"TabEnter"
		},
		config = function()
			require("alex.plugins.bufferline")
		end
	},

	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		-- event = "FocusGained",
		-- event = "CursorMoved",
		config = function()
			require("alex.plugins.vim-illuminate")
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gb", desc = "Comment: Block comment" },
			{ "gc", desc = "Comment: Line comment" },
		},
		config = function()
			require("Comment").setup()
		end
	},

	{
		"chrisgrieser/nvim-early-retirement",
		-- event = "VeryLazy",
		event = "BufAdd",
		config = function()
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
		config = function()
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
		event = "VeryLazy",
		config = function()
			require("alex.plugins.treesitter")
			require("alex.plugins.treesitter-context")
			-- vim.cmd("TSDisable highlight")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context"
		},
	},

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup {}
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			highlight = {
				multiline = true
			}
		}
	},

	{
		"SmiteshP/nvim-navic",
		event = "LspAttach",
		config = function()
			require("alex.plugins.nvim-navic")
		end
	},

	{
		"nyngwang/NeoZoom.lua",
		cmd = "NeoZoomToggle",
		config = function()
			require("alex.plugins.neozoom")
		end
	},
}
