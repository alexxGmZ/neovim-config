local lualine_setup, lualine = pcall(require, "lualine")
local nvim_navic_setup, navic = pcall(require, "nvim-navic")

if not nvim_navic_setup or
	not lualine_setup then
	return
end

-- rename mode names to shorter ones
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

-- this function is mainly for winbar
function custom_filename_path()
	local modified_symbol = ""
	local readonly_symbol = ""
	local navic_location = ""

	-- relative path, replace directory slashes to a bigger arrow
	local file_name = string.gsub(vim.fn.expand('%:~:.'), '/', "  ")

	-- enable navic if it's available
	if navic.is_available() and navic.get_location() ~= "" then
		navic_location = "  " .. navic.get_location()
	end

	-- if the current file is modified
	if vim.bo.modified then
		modified_symbol = " ●"
	end

	-- if the current file is readonly
	if vim.bo.readonly then
		readonly_symbol = " [RO]"
	end

	-- returns the stuff that is being outputted in winbar
	return file_name .. navic_location .. readonly_symbol .. modified_symbol
end

function buffer_name(buf)
	return buf.name
end

lualine.setup {
	options = {
		icons_enabled = true,
		-- theme = 'molokai',
		theme = 'horizon',
		-- section_separators = { left = '', right = ''},
		-- component_separators = { left = '', right = ''},
		component_separators = '',
		section_separators = {
			left = '',
			right = ''
		},
		disabled_filetypes = {
			statusline = {
				"NvimTree",
				"tagbar",
				"merginal",
				"packer",
				"Outline"
			},
			winbar = {
				"NvimTree",
				"tagbar",
				"merginal",
				"fugitive",
				"packer",
				"netrw",
				"Outline",
				"text"
			},
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
					right = ''
				},
				fmt = function()
					return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
				end
			},
		},
		lualine_b = {
			{'branch',
				-- color = {
				-- 	bg = '#f92672',
				-- 	fg = '#f7f5f5'
				-- },
				icons_enabled = true,
			},
			{'filename',
				path = 0,
				separator = {
					-- right = ''
					right = ''
				},
				symbols = {
					modified = "●",
					readonly = "[RO]"
				}
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
					right = ''
				},
				source = nil,
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
					right = ''
				}
			},
		},
		lualine_x = {},
		lualine_y = {'encoding', 'filetype', 'progress'},
		lualine_z = {
			{'location',
				separator = {
					left = '',
				}
			}
		}
	},

	inactive_sections = {
		lualine_a = {
			{'filename',
				path = 0,
				color = {
					fg = '#6C6F93',
					bg = '#2E303E'
				},
				separator = {
					right = ''
				},
				symbols = {
					modified = "●",
					readonly = "[RO]"
				}
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
					right = ''
				},
				source = nil,
			},
		},
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
					right = ''
				}
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{ 'encoding',
				color = {
					fg = '#6C6F93',
					bg = '#2E303E'
				}
			},
			{ 'filetype',
				color = {
					fg = '#6C6F93',
					bg = '#2E303E'
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
					left = '',
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
					right = ''
				},
				fmt = custom_filename_path
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
					right = ''
				},
				fmt = custom_filename_path
			},
		},
		lualine_b = {},
		lualine_c = {},
	},

	extensions = {}
}
