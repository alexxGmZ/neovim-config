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
				"javascript",
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
			ignore_install = {},
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
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			group = "HANDSOME",
			callback = function()
				local enable_highlight_filetypes = {
					"markdown",
					"git",
					"gitcommit",
					"fugitive"
				}
				local buf_filetype = vim.bo.filetype

				for _, filetype in ipairs(enable_highlight_filetypes) do
					if filetype == buf_filetype then
						vim.cmd("TSBufEnable highlight")
					end
				end
			end
		})

	end,
}
