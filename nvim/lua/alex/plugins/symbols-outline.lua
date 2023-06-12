
require("symbols-outline").setup({
	highlight_hovered_item = true,
	autofold_depth = 1,
	auto_unfold_hover = true,
	width = 20,
})

-- keymap
local map = vim.keymap
map.set("n", "<F8>", ":SymbolsOutline<CR>")
map.set("n", "<leader>tt", ":SymbolsOutline<CR>")
