require('bufferline').setup {
	options = {
		mode = "tabs",
		truncate_names = false,
		name_formatter = function(buf)
			buf.path = string.gsub(buf.path, os.getenv("PWD") .. "/", "")
			local buf_path_length = #buf.path
			local max_name_length = 45
			print(buf.path)

			-- truncate backwards
			if string.find(buf.path, "/") and buf_path_length > max_name_length  then
				buf.path = string.sub(buf.path, buf_path_length - max_name_length, buf_path_length)
				buf.path = "..." .. buf.path
			end
			return buf.path
		end,
		numbers = "ordinal",
		indicator = {
			style = "none"
		},
		separator_style = "slant",
		diagnostics = "nvim_lsp"
	}
}
