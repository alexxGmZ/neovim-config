require("notify").setup({
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
	render = "simple",
	stages = "fade",
	timeout = 1000,
	top_down = true
})
