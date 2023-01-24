-- local success, codewindow = pcall(require, "codewindow")
-- if not success then
-- 	return
-- end

require('codewindow').setup{
	active_in_terminals = false,
	auto_enable = false,
	exclude_filetypes = {},
	max_minimap_height = nil,
	max_lines = nil,
	minimap_width = 15,
	use_lsp = true,
	use_treesitter = true,
	use_git = true,
	width_multiplier = 2,
	z_index = 1,
	show_cursor = true,
	window_border = 'single'
}

-- codewindow.apply_default_keybinds()

local api = vim.api

-- custom codewindow commands
api.nvim_create_user_command('CWToggle', function() require('codewindow').toggle_minimap() end, {})
api.nvim_create_user_command('CWFocus', function() require('codewindow').toggle_focus() end, {})
api.nvim_create_user_command('CWOpen', function() require('codewindow').open_minimap() end, {})
api.nvim_create_user_command('CWClose', function() require('codewindow').close_minimap() end, {})
