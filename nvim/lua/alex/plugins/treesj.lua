return {
	"Wansmer/treesj",
	keys = {
		{ "<leader>m", "<cmd>TSJToggle<cr>", desc = "TreeSJ: Toggle" }
	},
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	config = function()
		require('treesj').setup({
			use_default_keymaps = true,
			max_join_length = 200,
		})
	end
}
