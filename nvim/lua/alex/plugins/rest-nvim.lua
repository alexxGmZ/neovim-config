return {
	"rest-nvim/rest.nvim",
	ft = "http",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		require("rest-nvim").setup({
			--- Get the same options from Packer setup
			result = {
				show_curl_command = true,
			}
		})

		-- keymap
		local map = vim.keymap
		map.set("n", "<leader>rq", "<Plug>RestNvim", { desc = "RestNvim: send request" })
		map.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "RestNvim: request preview" })
		map.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "RestNvim: repeat last request" })
	end
}
