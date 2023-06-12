vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup{
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

-- keymap
local map = vim.keymap
map.set("n", "<leader>F", ":NvimTreeToggle<CR>")
map.set("n", "<leader><leader>f", ":NvimTreeToggle<CR>")
map.set("n", "<F6>", ":NvimTreeToggle<CR>")

-- open nvim-tree when "nvim ."
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

