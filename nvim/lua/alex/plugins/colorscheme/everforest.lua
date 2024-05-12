return {
	"neanias/everforest-nvim",
	-- event = "CmdlineChanged",
	priority = 1000,
	config = function()
		require("everforest").setup({
			background = "medium",
			transparent_background_level = 0,
			italics = true,
			disable_italic_comments = false,
			sign_column_background = "none",
			ui_contrast = "high",
			dim_inactive_windows = true,
			diagnostic_text_highlight = false,
			diagnostic_virtual_text = "coloured",
			diagnostic_line_highlight = false,
			spell_foreground = false,
			show_eob = true,
			float_style = "dim",
			---@param highlight_groups Highlights
			---@param palette Palette
			on_highlights = function(highlight_groups, palette) end,
			---@param palette Palette
			colours_override = function(palette) end,
		})
		vim.cmd.colorscheme "everforest"
	end
}
