local indent_blankline_setup, indent_blankline = pcall(require, "indent_blankline")

if not indent_blankline_setup then
	return
end

vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2c2c2c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#45475e gui=nocombine]]

indent_blankline.setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
	-- show_trailing_blanklike_indent = true,
	show_current_context = true,
	show_current_context_start = false,
}
