local function setup_config()
	vim.cmd [[
			hi MatchParen gui=underline guifg=Orange guibg=#4e4e4e
		]]

	require("everforest").setup({
		background = "hard",
		transparent_background_level = 1,
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
			hl.TSBoolean = { fg = palette.purple, bold = true }
			hl.TSFloat = { fg = palette.purple, bold = true }
			hl.TSNumber = { fg = palette.purple, bold = true }
			hl.TSFunction = { link = "Function" }
			hl.TSFunctionCall = { link = "Function" }
			hl.TSKeyword = { fg = palette.red, italic = true }
			hl.TSParameter = { fg = palette.red, bold = true }
			hl.TSString = { fg = palette.green, bold = true }
			hl.TSConditional = { fg = palette.red, italic = true }
			hl.TSVariable = { fg = palette.none, bold = true }
			hl.TSMethod = { link = "Function" }
			hl.TSMethodCall = { link = "Function" }

			hl.CurrentWord = { fg = palette.none, underline = true }
			hl.String = { fg = palette.green, bold = true }
			hl.Keyword = { fg = palette.red, italic = true }
			hl.Constant = { fg = palette.orange, bold = true }
			hl.Function = { fg = palette.orange, bold = true }
			hl.IlluminatedWordRead = { bg = "#4e4e4e" }
			hl.IlluminatedWordText = { bg = "#4e4e4e" }
			hl.IlluminatedWordWrite = { bg = "#4e4e4e" }
			hl.NormalFloat = { bg = palette.bgdim }
			hl.FloatBorder = { bg = palette.bgdim }
			hl.FloatTitle = { bg = palette.bgdim }
			hl.luaFunc = { link = "Function" }
			hl.luaFunction = { link = "Function" }
			hl.vimFuncName = { link = "Function" }
			hl.vimFunction = { link = "Function" }
			hl.vimUserFunc = { link = "Function" }

			hl.BufferlineSeparator = { fg = palette.bg0 }
			hl.BufferlineSeparatorSelected = { fg = palette.bg0 }
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
