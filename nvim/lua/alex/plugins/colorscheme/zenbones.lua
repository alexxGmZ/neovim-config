return {
	"mcchrish/zenbones.nvim",
	-- priority = 999,
	event = "CmdlineChanged",
	dependencies = {
		"rktjmp/lush.nvim"
	},
	config = function()
		-- vim.cmd.colorscheme "forestbones"
		vim.g.forestbones = {
			transparent_background = true
		}
	end
}
