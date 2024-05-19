return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	config = function()
		require("illuminate").configure({
			providers = {
				'lsp',
				'treesitter',
				'regex',
			},
			modes_allowlist = {
				"n",
			},
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
		vim.cmd [[
			hi MatchParen gui=underline guifg=Orange guibg=#4e4e4e
			hi IlluminatedWordText guibg=#4e4e4e
			hi IlluminatedWordRead guibg=#4e4e4e
			hi IlluminatedWordWrite guibg=#4e4e4e
		]]

		vim.keymap.set("n", "<M-n>",
			function()
				require("illuminate").goto_next_reference()
			end,
			{ desc = "Illuminate: goto next reference" }
		)

		vim.keymap.set("n", "<M-p>",
			function()
				require("illuminate").goto_prev_reference()
			end,
			{ desc = "Illuminate: goto previous reference" }
		)
	end
}
