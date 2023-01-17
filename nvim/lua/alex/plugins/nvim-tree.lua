local nvim_tree_setup, nvim_tree = pcall(require, "nvim-tree")

if not nvim_tree_setup then
	return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- empty setup using defaults
nvim_tree.setup{
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
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
}
