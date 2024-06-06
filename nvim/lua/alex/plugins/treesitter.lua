return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter = require('nvim-treesitter.configs')
		treesitter.setup {
			-- parser_install_dir = "/home/alex/.local/share/nvim/lazy/nvim-treesitter",
			ensure_installed = {
				-- "lua",
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
				"sql"
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {
				"bash",
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"vim",
				"vimdoc"
			},
			highlight = {
				enable = false,
				disable = { "html", "lua", "javascript" },
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = { enable = false },
			indent = { enable = false }
		}

		-- since treesitter syntax highlighting is disabled by default,
		-- this autocmd enables it for some specific buffer filetypes only
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = {
				"markdown",
				"git",
				"gitcommit",
				"fugitive",
				"json"
			},
			group = "HANDSOME",
			callback = function()
				vim.cmd("TSBufEnable highlight")
			end
		})
	end,
}
