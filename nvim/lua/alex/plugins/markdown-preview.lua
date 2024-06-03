return {
	"iamcco/markdown-preview.nvim",
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
	config = function ()
		local g = vim.g
		g.mkdp_refresh_slow = 1
	end
}
