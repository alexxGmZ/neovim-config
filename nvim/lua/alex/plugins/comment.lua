return {
	"numToStr/Comment.nvim",
	keys = {
		{ "gb", desc = "Comment: Block comment" },
		{ "gc", desc = "Comment: Line comment" },
		{ "V" },
		-- { "v" },
	},
	config = function()
		require("Comment").setup()
	end
}
