require('bufferline').setup {
	options = {
		mode = "tabs",
		truncate_names = false,
		name_formatter = function(buf)
			--- truncate backwards
			-- buf.path = string.gsub(buf.path, "/home/al6x/", "~/")
			-- local tab_name_length = #buf.path
			-- local max_name_length = 35
			-- if tab_name_length > max_name_length then
			-- 	buf.path = string.sub(buf.path, tab_name_length - max_name_length, tab_name_length)
			-- 	buf.path = "..." .. buf.path
			-- end
			-- return buf.path
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
