return {
	"simrat39/symbols-outline.nvim",
	event = "LspAttach",
	config = function()
		require("symbols-outline").setup({
			highlight_hovered_item = true,
			autofold_depth = 1,
			auto_unfold_hover = false,
			width = 30,
			show_guides = true,
		})

		vim.keymap.set("n", "<F8>",
			function()
				vim.cmd("SymbolsOutline")
			end,
			{
				silent = true,
				desc = "SymbolsOutline: Toggle symbols outline"
			}
		)

		vim.keymap.set("n", "<leader>tt",
			function()
				vim.cmd("SymbolsOutline")
			end,
			{
				silent = true,
				desc = "SymbolsOutline: Toggle symbols outline"
			}
		)
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	}
}
