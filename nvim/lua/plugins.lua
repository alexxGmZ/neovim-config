local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	--
	-- COLORSCHEME --
	--
	-- catppuccin (main colorscheme)
	require("alex.plugins.catppuccin"),

	-- moonfly
	require("alex.plugins.moonfly"),

	-- tokyonight
	require("alex.plugins.tokyonight"),

	-- github
	require("alex.plugins.github-theme"),

	-- rose pine
	require("alex.plugins.rose-pine"),

	-- newpaper
	require("alex.plugins.newpaper"),
	-- #### COLORSCHEME #### --

	require("alex.plugins.lsp.cmp-spell"),
	require("alex.plugins.lsp.lsp-lens"),

	require("alex.plugins.live-server"),

	require("alex.plugins.oil"),

	require("alex.plugins.marp"),

	require("alex.plugins.fzf-lua"),

	require("alex.plugins.twilight"),

	require("alex.plugins.trouble"),

	require("alex.plugins.jaq-nvim"),

	{
		"nullchilly/fsread.nvim",
		cmd = { "FSRead", "FSToggle" }
	},

	require("alex.plugins.symbols-outline"),

	require("alex.plugins.codewindow"),

	require("alex.plugins.ccc"),

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

	--
	-- Git Integration --
	--
	require("alex.plugins.git-blame"),
	require("alex.plugins.gitsigns"),
	require("alex.plugins.merginal"),
	require("alex.plugins.git-conflict"),
	-- Git Integration --

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
			"FzfLua"
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/trouble.nvim",
			"simrat39/symbols-outline.nvim",
			"ibhagwan/fzf-lua",
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
		config = function()
			require("alex.plugins.vim-illuminate")
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "VeryLazy",
		cmd = "IndentBlanklineEnable",
		-- config = function ()
		-- 	require("alex.plugins.indent-blankline")
		-- end
	},

	require("alex.plugins.comment"),

	{
		"chrisgrieser/nvim-early-retirement",
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
			-- vim.cmd("TSDisable highlight")
		end,
	},

	require("alex.plugins.treesitter-context"),

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup {}
		end,
	},

	{
		"folke/todo-comments.nvim",
		-- enable = false,
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
