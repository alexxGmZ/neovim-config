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


	--
	-- Git Integration --
	--
	require("alex.plugins.git-blame"),
	require("alex.plugins.gitsigns"),
	require("alex.plugins.merginal"),
	require("alex.plugins.git-conflict"),

	--
	-- Language Server Protocol (LSP)
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
			"LspInfo",
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
		"chrisgrieser/nvim-dr-lsp",
		event = "LspAttach"
	},

	require("alex.plugins.diagflow"),
	require("alex.plugins.symbols-outline"),
	require("alex.plugins.lsp.lsp-lens"),

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
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	--
	-- User Interface
	--
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
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

	{
		"lukas-reineke/indent-blankline.nvim",
		-- event = "VeryLazy",
		cmd = "IndentBlanklineEnable",
		-- config = function ()
		-- 	require("alex.plugins.indent-blankline")
		-- end
	},

	{
		"sitiom/nvim-numbertoggle",
		event = "VeryLazy",
	},

	require("alex.plugins.nvim-navic"),
	require("alex.plugins.neozoom"),
	require("alex.plugins.codewindow"),

	--
	-- Uncategorized
	--
	require("alex.plugins.comment"),
	require("alex.plugins.early-retirement"),

	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.nvim-tmux-navigation")
		end
	},

	require("alex.plugins.notify"),
	require("alex.plugins.nvim-tree"),

	require("alex.plugins.treesitter"),
	require("alex.plugins.treesitter-context"),

	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup {}
		end,
	},

	require("alex.plugins.todo-comments"),

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

	require("alex.plugins.lsp.cmp-spell"),

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

}
