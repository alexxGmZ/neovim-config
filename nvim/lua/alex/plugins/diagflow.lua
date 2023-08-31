require("diagflow").setup({
	enable = true,
	max_width = 30,   -- The maximum width of the diagnostic messages
	severity_colors = { -- The highlight groups to use for each diagnostic severity level
		error = "DiagnosticFloatingError",
		warning = "DiagnosticFloatingWarning",
		info = "DiagnosticFloatingInfo",
		hint = "DiagnosticFloatingHint",
	},

	gap_size = 1,
	scope = "line", -- 'cursor', 'line'
	padding_top = 4,
	placement = "top",
	-- update_event = { "DiagnosticChanged", "BufReadPost", "BufEnter", "CursorMoved" },
	update_event = { "DiagnosticChanged", "BufReadPost", "BufEnter" },
	toggle_event = { "InsertEnter", "BufEnter" },
	show_sign = true, -- set to true if you want to render the diagnostic sign before the diagnostic message
	render_event = { "DiagnosticChanged", "CursorMoved" }
})
