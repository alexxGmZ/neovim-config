return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.opt.termguicolors = true

		-- empty setup using defaults
		require("nvim-tree").setup {
			sort_by = "name",
			view = {
				adaptive_size = false,
				number = false,
				relativenumber = false,
			},
			renderer = {
				add_trailing = true,
				group_empty = false,
				indent_markers = {
					enable = false,
					inline_arrows = false,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				}
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				debounce_delay = 50,
				icons = {
					error = "󰅙 ",
					warning = "󰀦 ",
					info = "󰋼 ",
					hint = "󰌵 "
				},
			},
			filters = {
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {},
				exclude = {},
			},
		}

		local function open_nvim_tree(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1

			if not directory then
				return
			end

			-- change to the directory
			vim.cmd.cd(data.file)

			-- open the tree
			require("nvim-tree.api").tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	}
}
