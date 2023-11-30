return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	dependencies = {
		-- "JoosepAlviste/nvim-ts-context-commentstring"
	},
	config = function()
		local vim = vim
		local opt = vim.opt

		opt.foldexpr = "nvim_treesitter#foldexpr()"

		local treesitter = require('nvim-treesitter.configs')

		treesitter.setup {
			ensure_installed = {
				"c",
				"lua",
				"rust",
				"html",
				"css",
				-- "javascript",
				"php",
				"latex",
				"python",
				"java",
				"bash",
				"cpp",
				"json",
				"markdown",
				"markdown_inline",
				"sql"
			},
			sync_install = false,
			auto_install = true,
			ignore_install = { "javascript" },
			highlight = {
				enable = true,
				disable = { "html" },
				additional_vim_regex_highlighting = false,
			},

			-- for nvim-ts-context-commentstring
			-- context_commentstring = {
			-- 	enable = true,
			-- },

			-- for nvim-ts-autotag
			-- autotag = {
			-- 	enable = true,
			-- 	enable_rename = true,
			-- 	enable_close = true,
			-- 	enable_close_on_slash = true,
			-- }
		}
		-- vim.cmd("TSDisable highlight")
	end,
}
