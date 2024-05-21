return {
	"lukas-reineke/indent-blankline.nvim",
	cmd = "IBLEnable",
	main = "ibl",
	config = function()
		require("ibl").setup()
	end
}
