return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	-- keys = {
	-- 	{ "gb", desc = "Comment: Block comment" },
	-- 	{ "gc", desc = "Comment: Line comment" },
	-- 	{ "V" },
	-- 	-- { "v" },
	-- },
	config = function()
		require("Comment").setup()
	end
}
