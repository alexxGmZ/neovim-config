return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = {
		"ConformInfo",
		"LspStart",
		"LspInfo",
		"Mason",
	},
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- Everything in opts will be passed to setup()
	opts = {
		formatters_by_ft = {
		},
	},
	config = function ()
	end
}
