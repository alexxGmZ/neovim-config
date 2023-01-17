-- local codewindow_setup, codewindow = pcall(require, "codewindow")
-- if not codewindow_setup then
-- 	return
-- end

require("codewindow").setup{
	active_in_terminals = false, -- Should the minimap activate for terminal buffers
	auto_enable = false, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
	exclude_filetypes = {}, -- Choose certain filetypes to not show minimap on
	max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
	max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
	minimap_width = 15, -- The width of the text part of the minimap
	use_lsp = true, -- Use the builtin LSP to show errors and warnings
	use_treesitter = true, -- Use nvim-treesitter to highlight the code
	use_git = true, -- Show small dots to indicate git additions and deletions
	width_multiplier = 2, -- How many characters one dot represents
	z_index = 1, -- The z-index the floating window will be on
	show_cursor = true, -- Show the cursor position in the minimap
	window_border = 'single' -- The border style of the floating window (accepts all usual options)
}

-- codewindow.apply_default_keybinds()

local api = vim.api

-- custom codewindow commands
api.nvim_create_user_command('CWToggle', function() require('codewindow').toggle_minimap() end, {})
api.nvim_create_user_command('CWFocus', function() require('codewindow').toggle_focus() end, {})
api.nvim_create_user_command('CWOpen', function() require('codewindow').open_minimap() end, {})
api.nvim_create_user_command('CWClose', function() require('codewindow').close_minimap() end, {})
