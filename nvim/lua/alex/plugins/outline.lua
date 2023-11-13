return {
	"hedyhli/outline.nvim",
	event = "LspAttach",
	-- cmd = { "Outline", "OutlineOpen" },
	config = function()
		require("outline").setup {
			outline_window = {
				-- Where to open the split window: right/left
				position = 'right',
				-- Only in this fork:
				-- The default split commands used are 'topleft vs' and 'botright vs'
				-- depending on `position`. You can change this by providing your own
				-- `split_command`.
				-- `position` will not be considered if `split_command` is non-nil.
				-- This should be a valid vim command used for opening the split for the
				-- outline window. Eg, 'rightbelow vsplit'.
				split_command = nil,

				-- Percentage or integer of columns
				width = 15,
				-- Whether width is relative to the total width of nvim
				-- When relative_width = true, this means take 25% of the total
				-- screen width for outline window.
				relative_width = true,

				-- Behaviour changed in this fork:
				-- Auto close the outline window if goto_location is triggered and not for
				-- peek_location
				auto_close = false,
				-- Automatically go to location in code when navigating outline window.
				-- Only in this fork
				auto_goto = false,

				-- Vim options for the outline window
				show_numbers = false,
				show_relative_numbers = false,

				-- Only in this fork (this and the one below)
				show_cursorline = true,
				-- Enable this when you enabled cursorline so your cursor color can
				-- blend with the cursorline, in effect, as if your cursor is hidden
				-- in the outline window.
				-- This is useful because with cursorline, there isn't really a need
				-- to know the vertical column position of the cursor and it may even
				-- be distracting, rendering lineno/guides/icons unreadable.
				-- This makes your line of cursor look the same as if the cursor wasn't
				-- focused on the outline window.
				hide_cursor = false,

				-- Whether to wrap long lines, or let them flow off the window
				wrap = false,
				-- Only in this fork:
				-- Whether to focus on the outline window when it is opened.
				-- Set to false to remain focus on your previous buffer when opening
				-- outline.
				focus_on_open = true,
				-- Only in this fork:
				-- Winhighlight option for outline window.
				-- See :help 'winhl'
				-- To change background color to "CustomHl" for example, append "Normal:CustomHl".
				-- Note that if you're adding highlight changes, you should append to this
				-- default value, otherwise details/lineno will not have highlights.
				winhl = "OutlineDetails:Comment,OutlineLineno:LineNr",
			},

			outline_items = {
				-- Whether to highlight the currently hovered symbol (high cpu usage)
				highlight_hovered_item = true,
				-- Show extra details with the symbols (lsp dependent)
				show_symbol_details = true,
				-- Only in this fork.
				-- Show line numbers of each symbol next to them.
				-- Why? See this comment:
				-- https://github.com/simrat39/symbols-outline.nvim/issues/212#issuecomment-1793503563
				show_symbol_lineno = false,
			},

			-- Options for outline guides.
			-- Only in this fork
			guides = {
				enabled = true,
				markers = {
					bottom = '└',
					middle = '├',
					vertical = '│',
					horizontal = '─',
				},
			},

			symbol_folding = {
				-- Depth past which nodes will be folded by default
				autofold_depth = 1,
				-- Automatically unfold hovered symbol
				auto_unfold_hover = true,
				markers = { '', '' },
			},

			preview_window = {
				-- Automatically open preview of code location when navigating outline window
				auto_preview = false,
				-- Automatically open hover_symbol when opening preview (see keymaps for
				-- hover_symbol).
				-- If you disable this you can still open hover_symbol using your keymap
				-- below.
				-- Only in this fork
				open_hover_on_preview = true,
				-- Only in this fork:
				width = 50, -- Percentage or integer of columns
				min_width = 50, -- This is the number of columns
				-- Whether width is relative to the total width of nvim.
				-- When relative_width = true, this means take 50% of the total
				-- screen width for preview window, ensure the result width is at least 50
				-- characters wide.
				relative_width = true,
				-- Border option for floating preview window.
				-- Options include: single/double/rounded/solid/shadow or an array of border
				-- characters.
				-- See :help nvim_open_win() and search for "border" option.
				border = 'single',
				-- winhl options for the preview window, see ':h winhl'
				winhl = '',
				-- Pseudo-transparency of the preview window, see ':h winblend'
				winblend = 0
			},

			providers = {
				lsp = {
					-- Lsp client names to ignore
					blacklist_clients = { "html" },
				},
			},
		}

		vim.keymap.set("n", "<F8>",
			function()
				vim.cmd("Outline")
			end,
			{
				silent = true,
				desc = "Outline: Toggle LSP code symbols outline"
			}
		)

		vim.keymap.set("n", "<leader>tt",
			function()
				vim.cmd("Outline")
			end,
			{
				silent = true,
				desc = "Outline: Toggle LSP code symbols outline"
			}
		)
	end,
}
