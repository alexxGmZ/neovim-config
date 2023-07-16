require("diagflow").setup({
	enable = true,
	max_width = 30,  -- The maximum width of the diagnostic messages
	severity_colors = {  -- The highlight groups to use for each diagnostic severity level
		error = "DiagnosticFloatingError",
		warning = "DiagnosticFloatingWarning",
		info = "DiagnosticFloatingInfo",
		hint = "DiagnosticFloatingHint",
	},

	gap_size = 1,
	scope = "line", -- 'cursor', 'line'
	padding_top = 10,
	update_event = { "DiagnosticChanged", "BufEnter" },
	toggle_event = { "InsertEnter" }
})
