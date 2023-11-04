return {
	"yaocccc/nvim-foldsign",
	config = function()
		require('nvim-foldsign').setup({
			offset = -2,
			foldsigns = {
				open = '-',                      -- mark the beginning of a fold
				close = '+',                     -- show a closed fold
				-- seps = { '│', '┃' }, -- open fold middle marker
				seps = { '', '' }, -- open fold middle marker
			}
		})
	end,
}
