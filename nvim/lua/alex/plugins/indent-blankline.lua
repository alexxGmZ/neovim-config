return {

	"lukas-reineke/indent-blankline.nvim",
	-- event = "VeryLazy",
	cmd = "IBLEnable",
	main = "ibl",
	config = function()
		-- vim.opt.list = true
		-- vim.opt.termguicolors = true
		-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2c2c2c gui=nocombine]]
		-- vim.cmd [[highlight IndentBlanklineContextChar guifg=#45475e gui=nocombine]]

		require("ibl").setup()
	end
}
