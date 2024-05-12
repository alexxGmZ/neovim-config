return {
	--
	-- COLORSCHEME --
	--
	-- catppuccin (main colorscheme)
	require("alex.plugins.colorscheme.catppuccin"),
	-- moonfly
	require("alex.plugins.colorscheme.moonfly"),
	-- tokyonight
	require("alex.plugins.colorscheme.tokyonight"),
	-- github
	require("alex.plugins.colorscheme.github-theme"),
	-- rose pine
	require("alex.plugins.colorscheme.rose-pine"),
	-- newpaper
	require("alex.plugins.colorscheme.newpaper"),
	-- kanagawa
	require("alex.plugins.colorscheme.kanagawa"),
	-- everforest
	require("alex.plugins.colorscheme.everforest"),

	--
	-- Git Integration --
	--
	require("alex.plugins.git-blame"),
	require("alex.plugins.gitsigns"),
	require("alex.plugins.merginal"),
	require("alex.plugins.git-conflict"),
	-- require("alex.plugins.neogit"),

	--
	-- Language Server Protocol (LSP)
	--
	{
		"neovim/nvim-lspconfig",
		event = {
			-- "InsertCharPre",
			-- "TabNew",
			-- "TabEnter",
		},
		cmd = {
			"LspStart",
			"LspInfo",
			"Trouble",
			-- "FzfLua",
			"Mason",
			"ConformInfo"
		},
		dependencies = {
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/trouble.nvim",
			"hedyhli/outline.nvim",
		},
		config = function()
			require("alex.plugins.lsp.mason")
			require("alex.plugins.lsp.lspconfig")
			vim.cmd("LspStart")
		end,
	},

	require("alex.plugins.diagflow"),
	require("alex.plugins.lsp.lsp-lens"),
	require("alex.plugins.outline"),
	-- require("alex.plugins.lsp.lsp-timeout"),

	--
	-- Auto completion
	--
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
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	-- require("alex.plugins.lsp.nvim-html-css"),
	require("alex.plugins.conform"),

	--
	-- User Interface
	--
	{
		"nvim-lualine/lualine.nvim",
		-- event = "VeryLazy",
		config = function()
			require("alex.plugins.lualine")
		end,
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

	require("alex.plugins.indent-blankline"),

	{
		"sitiom/nvim-numbertoggle",
		enabled = true,
		event = "VeryLazy",
	},

	-- require("alex.plugins.nvim-navic"),
	require("alex.plugins.neozoom"),
	require("alex.plugins.codewindow"),
	require("alex.plugins.tagbar"),

	--
	-- Uncategorized
	--
	require("alex.plugins.comment"),
	require("alex.plugins.early-retirement"),
	require("alex.plugins.nvim-tmux-navigation"),
	require("alex.plugins.notify"),
	require("alex.plugins.nvim-tree"),
	require("alex.plugins.todo-comments"),
	require("alex.plugins.treesitter"),
	require("alex.plugins.treesitter-context"),

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup {}
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},

	require("alex.plugins.autoclose"),
	require("alex.plugins.lsp.cmp-spell"),
	require("alex.plugins.live-server"),
	require("alex.plugins.oil"),
	require("alex.plugins.marp"),
	require("alex.plugins.fzf-lua"),
	require("alex.plugins.twilight"),
	require("alex.plugins.trouble"),
	require("alex.plugins.jaq-nvim"),
	require("alex.plugins.ccc"),

	{
		"nullchilly/fsread.nvim",
		cmd = { "FSRead", "FSToggle" }
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
		"gregsexton/MatchTag",
		event = "VeryLazy",
		ft = { 'markdown', 'html', 'php', 'xml', 'javascript' },
	},

	require("alex.plugins.vim-rest-console"),
	require("alex.plugins.dadbod-ui"),
	require("alex.plugins.codesnap"),
	require("alex.plugins.rayso")
}
