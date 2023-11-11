return {
	"numToStr/Comment.nvim",
	-- event = "VeryLazy",
	lazy = false,
	-- keys = {
	-- 	{ "gb", desc = "Comment: Block comment" },
	-- 	{ "gc", desc = "Comment: Line comment" },
	-- 	{ "V" },
	-- 	-- { "v" },
	-- },
	config = function()
		require("Comment").setup({
			-- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
		})
	end
}
