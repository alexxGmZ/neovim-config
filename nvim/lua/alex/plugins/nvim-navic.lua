return {
	"SmiteshP/nvim-navic",
	event = "LspAttach",
	config = function()
		require("nvim-navic").setup({
			lsp = {auto_attach = true},
			highlight = true,
			click = true,
		})
	end
}
