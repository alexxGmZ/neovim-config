require('bufferline').setup {
	options = {
		mode = "tabs",
		numbers = "ordinal",
		indicator = {
			style = "none"
		},
		separator_style = "slant",
		diagnostics = "nvim_lsp"
	}
}
