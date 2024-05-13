return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.opt.termguicolors = true

		vim.keymap.set("n", "<leader>F", function() vim.cmd("NvimTreeToggle") end,
			{ desc = "NvimTreeToggle: NvimTree File Explorer" })
		vim.keymap.set("n", "<F6>", function() vim.cmd("NvimTreeToggle") end,
			{ desc = "NvimTreeToggle: NvimTree File Explorer" })

		local HEIGHT_RATIO = 0.8 -- You can change this
		local WIDTH_RATIO = 0.5 -- You can change this too

		-- empty setup using defaults
		require("nvim-tree").setup {
			sort = {
				sorter = "name"
			},
			view = {
				adaptive_size = false,
				number = false,
				relativenumber = false,
				cursorline = true,
				signcolumn = "auto",
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * WIDTH_RATIO
						local window_h = screen_h * HEIGHT_RATIO
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2)
							 - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end
				},
				-- width = function()
				-- 	return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				-- end,
				width = 30
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
			tab = {
				sync = {
					open = true,
					close = true
				}
			}
		}
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	}
}
