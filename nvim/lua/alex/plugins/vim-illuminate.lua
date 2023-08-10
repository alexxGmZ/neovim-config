vim.cmd([[
	hi link IlluminatedWordText Visual
	hi link IlluminatedWordRead Visual
	hi link IlluminatedWordWrite Visual
	hi MatchParen cterm=none gui=underline
]])

require("illuminate").configure({
	filetypes_denylist = {
		"help",
		"text",
		"man",
		"markdown",
		"checkhealth",
		"NvimTree"
	},
})
