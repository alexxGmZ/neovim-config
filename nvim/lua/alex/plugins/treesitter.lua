return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	config = function()
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
				"markdown_inline"
			},
			sync_install = false,
			auto_install = true,
			ignore_install = { "javascript" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},

			-- for nvim-ts-autotag
			autotag = {
				enable = true,
			}
		}
		-- vim.cmd("TSDisable highlight")
	end,
}
