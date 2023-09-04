return {
	"rcarriga/nvim-notify",
	priority = 999,
	config = function()
		local notify = require("notify")

		notify.setup({
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
				DEBUG = " ",
				ERROR = "󰅙 ",
				INFO = "󰋼 ",
				TRACE = "✎ ",
				WARN = "󰀦 "
			},
			-- level = 0,
			level = vim.log.levels.INFO,
			minimum_width = 10,
			render = "default",
			stages = "fade",
			timeout = 2000,
			top_down = false
		})

		vim.notify = notify

		print = function(...)
			local print_safe_args = {}
			local _ = { ... }
			for i = 1, #_ do
				table.insert(print_safe_args, tostring(_[i]))
			end
			vim.notify(table.concat(print_safe_args, ' '), "info")
		end
	end
}
