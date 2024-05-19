return {
	"stevearc/oil.nvim",
	cmd = { "Oil", "OilToggleFloat" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				"permissions"
			},
			default_file_explorer = false,
			use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_split",
				["<C-v>"] = "actions.select_vsplit",
				["<C-t>"] = "actions.select_tab",
				["<Esc>"] = "actions.close",
				["<Tab>"] = "actions.preview",
				["<C-r>"] = "actions.refresh",
				["-"] = "actions.parent",
				["g."] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true
			},
			float = {
				padding = 4,
				max_width = 80
			},
		})

		vim.api.nvim_create_user_command("OilToggleFloat", function()
			require("oil").toggle_float()
		end, {})
	end,
}
