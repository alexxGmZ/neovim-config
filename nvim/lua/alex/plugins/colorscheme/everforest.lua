local function setup_config()
	require("everforest").setup({
		background = "hard",
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
		on_highlights = function(hl, palette)
			hl.TSBoolean = { link = "Boolean" }
			hl.TSFloat = { link = "Float" }
			hl.TSNumber = { link = "Number" }
			hl.TSFunction = { link = "Function" }
			hl.TSFunctionCall = { link = "Function" }
			hl.TSKeyword = { link = "Keyword" }
			hl.TSParameter = { fg = palette.red, bold = true }
			hl.TSString = { fg = palette.green, bold = true }
			hl.TSConditional = { fg = palette.red, italic = true }
			hl.TSVariable = { fg = palette.none, bold = true }
			hl.TSMethod = { link = "Function" }
			hl.TSMethodCall = { link = "Function" }
			hl.TreesitterContextBottom = { underline = true }

			hl.CurrentWord = { fg = palette.none, underline = true }
			hl.String = { fg = palette.green, bold = true }
			hl.Keyword = { fg = palette.red, italic = true }
			hl.Constant = { fg = palette.orange, bold = true }
			hl.Function = { fg = palette.orange, bold = true }
			hl.Boolean = { fg = palette.purple, bold = true }
			hl.Float = { fg = palette.purple, bold = true }
			hl.Number = { fg = palette.purple, bold = true }
			hl.NormalFloat = { bg = palette.bgdim }
			hl.FloatBorder = { bg = palette.bgdim }
			hl.FloatTitle = { bg = palette.bgdim }
			hl.luaFunc = { link = "Function" }
			hl.luaFunction = { link = "Function" }
			hl.vimFuncName = { link = "Function" }
			hl.vimFunction = { link = "Function" }
			hl.vimUserFunc = { link = "Function" }
		end,
		colours_override = function(palette) end,
	})
	vim.cmd.colorscheme "everforest"
end

return {
	"neanias/everforest-nvim",
	-- event = "CmdlineChanged",
	priority = 1000,
	config = function()
		setup_config()
	end
}
