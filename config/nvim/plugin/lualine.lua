local navic = require("nvim-navic")

local mode_map = {
	n = "NOR",
	nt = "NOR",
	i = "INS",
	R = "REP",
	v = "VIS",
	V = "VLI",
	no = "CHA",
	["\22"] = "VBL",
	t = "TER",
	['!'] = "SH",
	c = "COM"
}

function custom_filename_path()
	local modified_symbol = ""
	local readonly_symbol = ""
	-- relative path
	local file_name = string.gsub(vim.fn.expand('%:~:.'), '/', "  ")
	local navic_location = ""

	if navic.is_available() and navic.get_location() ~= "" then
		navic_location = "  " .. navic.get_location()
	end

	if vim.bo.modified then
		modified_symbol = " ●"
	end

	if vim.bo.readonly then
		readonly_symbol = " [RO]"
	end

	-- print(navic.get_location(), navic.is_available())
	return file_name .. readonly_symbol .. modified_symbol .. navic_location
end

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'molokai',
		-- component_separators = { left = '', right = ''},
		component_separators = '',
		section_separators = {
			left = '',
			right = ''
		},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},

	sections = {
		lualine_a = {
			{'mode',
				icons_enabled = true,
				separator = {
					left = '',
					right = ''
				},
				fmt = function()
					return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
				end
			},
		},
		lualine_b = {
			{'branch',
				color = {
					bg = '#f92672',
					fg = '#f7f5f5'
				},
				separator = {
					right = ''
				},
				icons_enabled = true,
			},
		},
		lualine_c = {
			{'diagnostics',
				color = {
					bg = '#1a1b26',
				},
				sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
				sections = { 'error', 'warn', 'info', },
				symbols = {
					error = ' ',
					warn = ' ',
					info = ' ',
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
				separator = {
					right = ''
				}
			},
		},
		lualine_x = {},
		lualine_y = {'encoding', 'filetype', 'progress'},
		lualine_z = {
			{'location',
				separator = {
					left = '',
					right = ''
				}
			}
		}
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			{'diagnostics',
				color = {
					bg = '#1a1b26',
				},
				sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
				sections = { 'error', 'warn', 'info', },
				symbols = {
					error = ' ',
					warn = ' ',
					info = ' ',
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
				separator = {
					right = ''
				}
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{ 'encoding', 'filetype',
				color = {
					fg = '#1a1b26',
				}
			},
			{ 'filetype',
				color = {
					fg = '#1a1b26',
				}
			}
		},
		lualine_z = {
			{'location',
				color = {
					bg = '#66d9ef',
					fg = '#1a1b26'
				},
				separator = {
					left = '',
					right = ''
				},
			}
		}
	},

	winbar = {
		lualine_a = {
			{'filename',
				color = {
					bg = '#474973',
					fg = '#cdd6f4'
				},
				separator = {
					-- right = ''
					right = ''
				},
				fmt = custom_filename_path
			},
			{'diff',
				colored = true,
				color = {
					bg = '#1a1b26',
				},
				diff_color = {
					added = {
						fg = '#9ece6a',
					},
					modified = {
						fg = '#7dcfff',
					},
					removed = {
						fg = '#f7768e',
					},
				},
				symbols = {
					added = '+',
					modified = '~',
					removed = '-',
				},
				separator = {
					-- right = ''
					right = ''
				},
				source = nil,
			},
		},
		lualine_b = {
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},

	inactive_winbar = {
		lualine_a = {
			{'filename',
				color = {
					bg = '#474973',
					fg = '#cdd6f4'
				},
				separator = {
					-- right = ''
					right = ''
				},
				fmt = custom_filename_path
			},
			{'diff',
				colored = true,
				color = {
					bg = '#1a1b26',
				},
				diff_color = {
					added = {
						fg = '#9ece6a',
					},
					modified = {
						fg = '#7dcfff',
					},
					removed = {
						fg = '#f7768e',
					},
				},
				symbols = {
					added = '+',
					modified = '~',
					removed = '-',
				},
				separator = {
					-- right = ''
					right = ''
				},
				source = nil,
			},
		},
		lualine_b = {},
		lualine_c = {},
	},

	extensions = {}
}
