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
		}
	},
}
