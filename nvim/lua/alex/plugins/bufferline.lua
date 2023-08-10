require("bufferline").setup {
	-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		always_show_bufferline = false,
		mode = "tabs",
		truncate_names = false,
		name_formatter = function(buf)
			return buf.name
		end,
		numbers = "ordinal",
		indicator = {
			style = "none"
		},
		separator_style = "slant",
		diagnostics = "nvim_lsp",

		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and "󰅚 " or
					(e == "warning" and "󰀪 ") or
					(e == "info" and "󰋽 " or "󰌶 ")

				s = s .. sym .. n .. " "
			end
			return s
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "tagbar",
				text = "Tag Bar",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "merginal",
				text = "Source Control",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "packer",
				text = "Plugins",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "Outline",
				text = "Outline",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "Trouble",
				text = "Diagnostics",
				highlight = "Directory",
				separator = true
			},
		}
	},
}
