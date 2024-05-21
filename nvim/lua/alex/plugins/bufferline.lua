require("bufferline").setup {
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
		separator_style = "thick",
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
			{
				filetype = "Trouble",
				text = "Diagnostics",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "dbui",
				text = "Database",
				highlight = "Directory",
				separator = true
			},
			{
				filetype = "fugitive",
				text = "Git",
				highlight = "Directory",
				separator = true
			},
		}
	},
}
