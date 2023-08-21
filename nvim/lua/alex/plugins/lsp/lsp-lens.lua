return {
	"VidocqH/lsp-lens.nvim",
	event = "LspAttach",
	config = function()
		require("lsp-lens").setup({})
		vim.cmd("LspLensOff")
	end,
	-- cmd = { "LspLensOn", "LspLensToggle" }
}
