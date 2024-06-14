return {
	"sainnhe/gruvbox-material",
	event = "CmdlineChanged",
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_enable_bold = true
		vim.g.gruvbox_material_ui_contrast = "high"
		vim.g.gruvbox_material_transparent_background = 0
		vim.g.gruvbox_material_float_style = "dim"
	end
}
