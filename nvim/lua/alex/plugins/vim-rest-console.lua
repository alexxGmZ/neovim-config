vim.g.vrc_set_default_mapping = 0
vim.g.vrc_response_default_content_type = "application/json"
vim.g.vrc_output_buffer_name = "response.json"
vim.g.vrc_auto_format_response_enabled = 1
vim.g.vrc_auto_format_response_patterns = {
	json = "jq"
}
return {
	"diepm/vim-rest-console",
	ft = "rest",
	config = function()
		vim.keymap.set("n", "<leader>rq", function()
			vim.cmd("call VrcQuery()")
		end, { desc = "Vim Rest Console query" })
	end
}
