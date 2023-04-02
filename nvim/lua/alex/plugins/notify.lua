local notify = require("notify")

notify.setup({
	background_colour = "NotifyBackground",
	fps = 10,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},
	level = 2,
	minimum_width = 10,
	render = "default",
	stages = "fade",
	timeout = 2000,
	top_down = false
})

vim.notify = notify
