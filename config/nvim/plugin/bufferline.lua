local utils = require("bufferline.utils")
require('bufferline').setup {
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
		diagnostics = "nvim_lsp"
	}
}
