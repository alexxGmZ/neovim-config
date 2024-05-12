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
			dim_inactive_windows = false,
			diagnostic_text_highlight = false,
			diagnostic_virtual_text = "coloured",
			diagnostic_line_highlight = false,
			spell_foreground = false,
			show_eob = true,
			float_style = "dim",
			---@param hl
			---@param palette
			on_highlights = function(hl, palette)
				hl.TSBoolean = { fg = palette.purple, bold = true }
				hl.TSFloat = { fg = palette.purple, bold = true }
				hl.TSNumber = { fg = palette.purple, bold = true }
				hl.TSFunction = { fg = palette.green, bold = true }
				hl.TSFunctionCall = { fg = palette.green, bold = true }
				hl.TSKeyword = { fg = palette.red, italic = true }
				hl.TSParameter = { fg = palette.red, bold = true }
				hl.TSString = { fg = palette.aqua, bold = true }
				hl.TSConditional = { fg = palette.red, italic = true }
				hl.TSVariable = { fg = palette.none, bold = true }

				hl.CurrentWord = { fg = palette.none, underline = true }
				hl.String = { fg = palette.aqua, bold = true }
				hl.Keyword = { fg = palette.red, italic = true }
			end,
			---@param palette Palette
			colours_override = function(palette) end,
		})
		vim.cmd.colorscheme "everforest"
	end
}
