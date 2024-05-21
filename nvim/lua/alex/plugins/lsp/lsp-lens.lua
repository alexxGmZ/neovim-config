return {
	"VidocqH/lsp-lens.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("lsp-lens").setup({})
	end,
	cmd = { "LspLensOn", "LspLensToggle" }
}
