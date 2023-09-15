return {

	"alexghergh/nvim-tmux-navigation",
	event = "VeryLazy",
	config = function()
		local nvim_tmux_nav = require('nvim-tmux-navigation')

		nvim_tmux_nav.setup {
			disable_when_zoomed = true -- defaults to false
		}

		vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "NvimTmux: Navigate Left" })
		vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "NvimTmux: Navigate Down" })
		vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "NvimTmux: Navigate Up" })
		vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "NvimTmux: Navigate Right" })
		vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = "NvimTmux: Navigate Last Active" })
		vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, { desc = "NvimTmux: Navigate Next" })
	end
}
