local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
	return
end

bufferline.setup {
	options = {
		always_show_bufferline = true,
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
				separator = true -- use a "true" to enable the default, or set your own character
			},
			{
				filetype = "tagbar",
				text = "Tag Bar",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			},
			{
				filetype = "merginal",
				text = "Source Control",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			},
			{
				filetype = "packer",
				text = "Plugins",
				highlight = "Directory",
				separator = true -- use a "true" to enable the default, or set your own character
			}
		}
	},
}
