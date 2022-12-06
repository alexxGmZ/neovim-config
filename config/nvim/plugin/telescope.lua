local telescope_setup, telescope = pcall(require, "telescope")

if not telescope_setup then
	return
end

local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

-- builtin keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup{
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-s>"] = actions.select_horizontal,
			}
		},
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				height = 0.9,
				prompt_position = 'bottom',
				width = 0.9,
				preview_cutoff = 10
			}
		}
	}
}
