return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon", "permissions" },
			default_file_explorer = true,
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
			view_options = { show_hidden = true },
			float = { padding = 4, max_width = 80 },
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
		})

		vim.api.nvim_create_user_command("OilToggleFloat", function()
			local oil = require("oil")
			local buf_filetype = vim.bo.filetype
			local filetype_exclude = {
				"fugitive",
				"git",
				"gitcommit",
				"help"
			}

			for _, filetype in ipairs(filetype_exclude) do
				if filetype == buf_filetype then
					local current_dir = vim.fn.getcwd()
					return oil.toggle_float(current_dir)
				end
			end

			return oil.toggle_float()
		end, { desc = "Oil: Toggle float" })

		vim.keymap.set("n", "<leader>F", "<cmd>OilToggleFloat<cr>", { desc = "Oil: Toggle Float" })
	end,
}
