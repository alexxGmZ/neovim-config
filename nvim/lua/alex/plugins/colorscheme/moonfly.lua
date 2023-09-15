vim.g.moonflyCursorColor = true
vim.g.moonflyItalics = true
vim.g.moonflyTerminalColors = false
vim.g.moonflyTransparent = false

return {

	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	-- lazy = false,
	-- priority = 1000,
	-- event = "VeryLazy",
	-- event = "CmdlineEnter",
	event = "CmdlineChanged",
	config = function()
	end
}
