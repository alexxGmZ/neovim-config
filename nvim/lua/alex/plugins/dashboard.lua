local function plugin_config()
	require('dashboard').setup {
		theme = "hyper",
		disable_move = false,
		shortcut_type = "number",
		config = {
			week_header = {
				enable = true,
				append = {
					" ",
					"Al's Personal Development Environment"
				}
			},
			shortcut = {
				{
					icon = "󰉋 ",
					desc = "Files", group = 'RainbowdelimiterBlue', key = 'F',
					action = function()
						vim.cmd("OilToggleFloat")
					end
				},
				{
					icon = " ",
					desc = "Fuzzy find", group = 'RainbowDelimiterOrange', key = 'fz',
					action = function()
						vim.cmd("FzfLua files")
					end
				},
				{
					icon = "󰈞 ",
					desc = "Live grep", group = 'RainbowDelimiterOrange', key = 'fg',
					action = function()
						vim.cmd("FzfLua live_grep")
					end
				},
				{
					icon = "󰚰 ",
					desc = "Check updates", group = 'RainbowDelimiterYellow', key = 'cu',
					action = function()
						vim.cmd("Lazy check")
					end
				},
				{
					icon = "󰓅 ",
					desc = "Benchmark", group = 'RainbowDelimiterYellow', key = 'B',
					action = function()
						vim.cmd("Lazy profile")
					end
				},
				{
					icon = "󰆼 ",
					desc = "Database", group = 'RainbowDelimiterCyan', key = 'db',
					action = function()
						vim.cmd[[
							bdelete
							DBUI
						]]
					end
				},
				-- {
				-- 	icon = "󰈹 ",
				-- 	desc = "FireFox", group = 'RainbowDelimiterRed', key = 'fr',
				-- 	action = function()
				-- 		vim.cmd("!firefox")
				-- 	end
				-- },
			},
			project = { enable = false },
			mru = {
				limit = 8,
				cwd_only = true,
				label = "Recent Files"
			},
			footer = function()
				return require("fortune").get_fortune()
			end
		},
		hide = {
			statusline = true, -- hide statusline default is true
			tabline = true, -- hide the tabline
			winbar = true -- hide winbar
		},
	}
end

return {
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	-- cond = function()
	-- 	if next(vim.fn.argv()) == nil then
	-- 		return true
	-- 	end
	-- end,
	config = plugin_config,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		{
			"rubiin/fortune.nvim",
			config = function()
				require("fortune").setup({
					display_format = "mixed"
				})
			end
		}
	}
}
