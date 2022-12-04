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


require('codewindow').apply_default_keybinds()
