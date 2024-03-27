return {
	'kristijanhusak/vim-dadbod-ui',
	dependencies = {
		{
			'tpope/vim-dadbod',
			ft = { 'sql', 'mysql', 'plsql' },
			lazy = true
		},
		{
			'kristijanhusak/vim-dadbod-completion',
			ft = { 'sql', 'mysql', 'plsql' },
			lazy = true
		},
	},
	cmd = {
		'DBUI',
		'DBUIToggle',
		'DBUIAddConnection',
		'DBUIFindBuffer',
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 30
		vim.g.db_ui_use_nvim_notify = 1
		vim.g.db_ui_disable_mappings = 1
		vim.g.db_ui_show_help = 0
	end,
	config = function()
		local map = vim.keymap
		map.set("n", "<CR>", "<Plug>(DBUI_SelectLine)", { desc = "DBUI: Select line" })
		map.set("n", "K", "<Plug>(DBUI_ToggleDetails)", { desc = "DBUI: ToggleDetails" })
		-- map.set("n", "<leader>q", "<Plug>(DBUI_Quit)", { desc = "DBUI: Quit" })

		-- vim.api.nvim_create_user_command("DBUIRefresh",
		-- 	function()
		-- 		vim.cmd [[ execute "normal \<Plug>(DBUI_Redraw)"]]
		-- 	end, {}
		-- )
		-- vim.api.nvim_create_user_command("DBUIRenameLine",
		-- 	function()
		-- 		vim.cmd [[ execute "normal \<Plug>(DBUI_RenameLine)"]]
		-- 	end, {}
		-- )
		-- vim.api.nvim_create_user_command("DBUIDeleteLine",
		-- 	function()
		-- 		vim.cmd [[ execute "normal \<Plug>(DBUI_DeleteLine)"]]
		-- 	end, {}
		-- )
		-- vim.api.nvim_create_user_command("DBUISaveQuery",
		-- 	function()
		-- 		vim.cmd [[ execute "normal \<Plug>(DBUI_SaveQuery)"]]
		-- 	end, {}
		-- )

		-- vim.cmd [[
		-- 	autocmd FileType dbui nmap <buffer> R <Plug>(DBUI_Redraw)
		-- 	autocmd FileType dbui nmap <buffer> r <Plug>(DBUI_Redraw)
		-- ]]

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "dbui" },
			callback = function(ev)
				local opts = { buffer = ev.buf }
				map.set("n", "R", "<Plug>(DBUI_Redraw)", opts)
				map.set("n", "D", "<Plug>(DBUI_DeleteLine)", opts)
				map.set("n", "r", "<Plug>(DBUI_RenameLine)", opts)
				map.set("n", "q", "<Plug>(DBUI_Quit)", opts)
				map.set("n", "W", "<Plug>(DBUI_SaveQuery)", opts)
			end
		})
	end

}
