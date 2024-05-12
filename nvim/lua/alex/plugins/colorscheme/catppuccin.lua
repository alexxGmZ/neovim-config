return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- priority = 1000,
	event = "CmdlineChanged",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			term_colors = true,
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = { "italic" },
				functions = {},
				keywords = { "italic" },
				strings = { "bold" },
				variables = { "bold" },
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = { "bold" },
			},
			color_overrides = {},
			custom_highlights = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				notify = false,
				mini = false,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				navic = {
					enabled = true,
				},
				illuminate = false,
				mason = true,
				symbols_outline = true,
				treesitter_context = true,
			},
		})

		-- switch to dark mode when it's 6:00PM
		-- local current_hour = tonumber(os.date("%H"))
		-- if (current_hour >= 17 or current_hour < 6) then
		-- 	vim.cmd.colorscheme "catppuccin-mocha"
		-- else
		-- 	vim.cmd.colorscheme "catppuccin-latte"
		-- end
		-- vim.cmd.colorscheme "catppuccin-mocha"
	end,
	opts = {
	}
}
