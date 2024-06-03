local function illuminate_highlights()
	vim.cmd [[
		hi IlluminatedWordText guibg=#4e4e4e gui=NONE
		hi IlluminatedWordRead guibg=#4e4e4e gui=NONE
		hi IlluminatedWordWrite guibg=#4e4e4e gui=NONE
	]]
end

return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").configure({
			providers = { 'lsp', 'treesitter', 'regex' },
			modes_allowlist = { "n" },
			filetypes_denylist = {
				"help",
				"text",
				"man",
				"checkhealth",
				"NvimTree",
				"Outline"
			},
			min_count_to_highlight = 2,
		})

		illuminate_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			group = "HANDSOME",
			callback = illuminate_highlights,
		})
	end
}
