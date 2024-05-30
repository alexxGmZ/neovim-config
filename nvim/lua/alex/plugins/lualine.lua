local lualine = require("lualine")

-- rename mode names to shorter ones
local mode_map = {
	n = "N",
	nt = "N",
	i = "I",
	R = "R",
	v = "V",
	V = "VL",
	no = "CHA",
	["\22"] = "VB",
	t = "T",
	['!'] = "SH",
	c = "C",
	s = "SUB"
}

local function lsp_client()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.buf_get_clients(bufnr)
	if next(clients) == nil then
		return ''
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	-- return '\u{f085} ' .. table.concat(c, ' | ')
	return table.concat(c, ' ')
end

local function macro_recording()
	local reg = vim.fn.reg_recording()
	if reg == "" then return "" end -- not recording
	return "recording @" .. reg
end

local function word_cnt()
	local buf_filetype = vim.bo.filetype
	local include_filetypes = {
		"markdown",
		"text"
	}
	local word_count = vim.fn.wordcount().words
	local visual_word_count = vim.fn.wordcount().visual_words
	local curr_mode = vim.api.nvim_get_mode().mode

	if curr_mode == "v" or curr_mode == "V" then
		for _, filetype in ipairs(include_filetypes) do
			if filetype == buf_filetype then
				return "Words: " .. word_count .. "(" .. visual_word_count .. ")"
			end
		end
	end

	for _, filetype in ipairs(include_filetypes) do
		if filetype == buf_filetype then
			return "Words: " .. word_count
		end
	end

	return ""
end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = "",
		section_separators = {
			right = "",
			-- left = ""
			-- right = ""
		},
		disabled_filetypes = {
			statusline = {
				"NvimTree",
				"tagbar",
				"merginal",
				"packer",
				"Outline",
				"oil",
				"trouble",
				"dbui",
				"fugitive",
				"dashboard",
			},
			winbar = {
				"NvimTree",
				"tagbar",
				"merginal",
				"fugitive",
				"packer",
				"netrw",
				"Outline",
				"text",
				"log",
				"help",
				"Jaq",
				"qf",
				"Trouble",
				"oil",
				"man"
			},
		},
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = false,
		refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
	},

	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
				separator = {
					left = "",
					right = ""
					-- right = ""
				},
				fmt = function()
					return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
				end
			},
		},
		lualine_b = {
			{
				"branch",
				color = { bg = "#66d9ef", fg = "#1a1b26" },
				icons_enabled = true,
				separator = { right = "" },
			},
			{
				"diff",
				colored = true,
				symbols = {
					added = "󰐖 ", -- nf-md-plus_box
					modified = "󱗜 ", -- nf-md-circle_box
					removed = "󰍵 ", -- nf-md-minus_box
				},
				separator = { right = "" },
				source = nil,
			},
			{
				"filename",
				path = 0,
				separator = { right = "" },
				symbols = { modified = "●", readonly = "[RO]" }
			},
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn", "info", },
				symbols = { error = "󰅙 ", warn = "󰀦 ", info = "󰋼 " },
				colored = true,
				update_in_insert = false,
				always_visible = false,
				-- separator = { right = "" }
			},
		},
		lualine_x = { word_cnt, macro_recording, "searchcount" },
		lualine_y = { lsp_client, "encoding", "filetype" },
		lualine_z = {
			{
				"location",
				separator = { left = "", right = "" },
			}
		}
	},

	inactive_sections = {
		lualine_a = {
			{
				"filename",
				path = 0,
				separator = {},
				symbols = { modified = "●", readonly = "[RO]" }
			},
			{
				"diff",
				colored = true,
				symbols = {
					added = "󰜄 ", -- nf-md-plus_box_outline
					modified = "󱗝 ", -- nf-md-circle_box_outline
					removed = "󰛲 ", -- nf-md-minus_box_outline
				},
				separator = {},
				source = nil,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", },
				symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 " },
				colored = true,
				update_in_insert = false,
				always_visible = false,
				separator = {}
			},
		},
		lualine_c = {},
		lualine_x = { word_cnt },
		lualine_y = { { "filetype" } },
		lualine_z = {
			{
				"location",
				separator = {},
			}
		}
	},

	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {
			-- {
			-- 	"diagnostics",
			-- 	sources = { "nvim_workspace_diagnostic" },
			-- 	sections = { "error", "warn", "info", "hint" },
			-- 	symbols = {
			-- 		error = "󰅙 ",
			-- 		warn = "󰀦 ",
			-- 		info = "󰋼 ",
			-- 		hint = "󰌵 "
			-- 	},
			-- 	colored = true,
			-- 	update_in_insert = false,
			-- 	always_visible = true,
			-- }
		},
		lualine_y = {},
		lualine_z = {}
	},

	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {
			-- {
			-- 	"diagnostics",
			-- 	sources = { "nvim_workspace_diagnostic" },
			-- 	sections = { "error", "warn", "info", "hint" },
			-- 	symbols = {
			-- 		error = "󰅚 ",
			-- 		warn = "󰀪 ",
			-- 		info = "󰋽 ",
			-- 		hint = "󰌶 ",
			-- 	},
			-- 	colored = true,
			-- 	update_in_insert = false,
			-- 	always_visible = true,
			-- }
		},
	},

	extensions = {}
}
