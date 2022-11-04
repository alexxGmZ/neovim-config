vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2c2c2c gui=nocombine]]
require("indent_blankline").setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
}
