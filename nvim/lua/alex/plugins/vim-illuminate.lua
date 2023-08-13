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

vim.keymap.set("n", "<M-n>",
	function()
		require("illuminate").goto_next_reference()
	end,
	{ desc = "Illuminate: goto next reference" }
)

vim.keymap.set("n", "<M-p>",
	function()
		require("illuminate").goto_prev_reference()
	end,
	{ desc = "Illuminate: goto previous reference" }
)
