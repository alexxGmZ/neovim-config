return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	config = function()
		local treesitter = require('nvim-treesitter.configs')
		treesitter.setup {
			-- parser_install_dir = "/home/alex/.local/share/nvim/lazy/nvim-treesitter",
			ensure_installed = {
				"c",
				-- "lua",
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
			ignore_install = { "javascript", "csv" },
			highlight = {
				enable = false,
				disable = { "html", "lua", "javascript" },
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = { enable = false },
			indent = { enable = false }
		}
	end,
}
