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
			},
		},
		lualine_b = {
			{'filename',
				color = {
					bg = '#c7d158'
				},
				separator = {
					right = ''
				},
				symbols = {
					modified = '●',
					readonly = '[RO]',
				}
			}
		},
		lualine_c = {
			{'diagnostics',
				color = {
					bg = '#1a1b26',
				},
				sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
				sections = { 'error', 'warn', 'info', 'hint' },
				symbols = {
					error = 'E',
					warn = 'W',
					info = 'I',
					hint = 'H'
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
		lualine_a = {
			{'filename',
				color = {
					bg = '#c7d158',
					fg = '#1a1b26'
				},
				separator = {
					left = '',
					right = ''
				},
				symbols = {
					modified = '●',
					readonly = '[RO]',
				},
			}
		},
		lualine_b = {
			{'diagnostics',
				color = {
					bg = '#1a1b26',
				},
				sources = { 'nvim_diagnostic', 'coc', 'ale', 'nvim_lsp' },
				sections = { 'error', 'warn', 'info', 'hint' },
				symbols = {
					error = 'E',
					warn = 'W',
					info = 'I',
					hint = 'H'
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
		lualine_y = {},
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
	tabline = {
		lualine_a = {
			{'branch',
				color = {
					bg = '#f92672',
					fg = '#f7f5f5'
				},
				separator = {
					left = '',
					right = ''
				},
				icons_enabled = true,
			},
		},
		lualine_b = {
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
					right = ''
				},
				source = nil,
			},
		},
		lualine_c = {
			{'filename',
				color = {
					bg = '#c7d158',
					fg = '#2c2c2c'
				},
				path = 1,
				shorting_target = 0,
				separator = {
					left = '',
					right = ''
				},
				symbols = {
					modified = '●',
					readonly = '[RO]',
				}
			}
		},
		lualine_z = {
			{'tabs',
				mode = 0,
				separator = {
					left = '',
					right = ''
				},
			},
		}
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
