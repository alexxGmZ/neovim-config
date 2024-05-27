return {
	"xiyaowong/transparent.nvim",
	config = function ()
		vim.cmd("TransparentEnable")
		if vim.g.neovide then
			vim.cmd("TransparentDisable")
		end
		require("transparent").setup({
			exclude_groups = {
			}
		})
	end
}
