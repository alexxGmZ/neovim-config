local function plugin_config()
	require('dashboard').setup {
		theme = "hyper",
		disable_move = false,
		shortcut_type = "number",
		config = {
			week_header = {
				enable = true
			},
			shortcut = {
				{
					desc = "󰉋 File explorer", group = 'RainbowdelimiterBlue', key = 'F',
					action = function()
						vim.cmd("NvimTreeToggle")
					end
				},
				{
					desc = " Fuzzy find files", group = 'RainbowDelimiterOrange', key = 'fz',
					action = function()
						vim.cmd("FzfLua files")
					end
				},
				{
					desc = "󰈞 Live grep files", group = 'RainbowDelimiterOrange', key = 'fg',
					action = function()
						vim.cmd("FzfLua live_grep")
					end
				},
				{
					desc = "󰚰 Check for updates", group = 'RainbowDelimiterYellow', key = 'cu',
					action = function()
						vim.cmd("Lazy check")
					end
				},
				{
					desc = "󰓅 Benchmark", group = 'RainbowDelimiterYellow', key = 'cb',
					action = function()
						vim.cmd("Lazy profile")
					end
				},
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
	event = 'UIEnter',
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
