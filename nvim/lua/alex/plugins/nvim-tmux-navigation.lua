return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require('nvim-tmux-navigation')

		nvim_tmux_nav.setup { disable_when_zoomed = true }
	end,
	keys = {
		{ "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>",  desc = "NvimTmux: Navigate Left" },
		{ "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>",  desc = "NvimTmux: Navigate Down" },
		{ "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>",    desc = "NvimTmux: Navigate Up" },
		{ "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", desc = "NvimTmux: Navigate Right" },
	}
}
