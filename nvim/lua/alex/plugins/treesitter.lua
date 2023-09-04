return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	config = function()
		local nvim_treesitter_setup, treesitter = pcall(require, "nvim-treesitter")
		if not nvim_treesitter_setup then
			return
		end

		treesitter = require('nvim-treesitter.configs')

		treesitter.setup {
			ensure_installed = {
				"c",
				"lua",
				"rust",
				"html",
				"css",
				"javascript",
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
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			-- for nvim-ts-autotag
			autotag = {
				enable = true,
			}
		}
		-- vim.cmd("TSDisable highlight")
	end,
}
