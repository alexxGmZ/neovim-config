-- Light monochrome colorscheme
-- Minimally uses everforest light palette

local set_var = vim.api.nvim_set_var
local set_hl = vim.api.nvim_set_hl

local palette = {
   bg = "#CCCCCC",       -- Lightest
   white = "#C2C2C2",    -- Light Gray
   yellow1 = "#B8B8B8",  -- Softer Yellow
   yellow2 = "#AEAEAE",  -- Deeper Yellow
   cyan1 = "#A4A4A4",    -- Soft Cyan
   cyan2 = "#9A9A9A",    -- Deeper Cyan
   magenta1 = "#909090", -- Mid Magenta
   magenta2 = "#868686", -- Darker Magenta
   blue1 = "#7C7C7C",    -- Mid Blue
   blue2 = "#727272",    -- Darker Blue
   green1 = "#686868",   -- Mid Green
   green2 = "#5E5E5E",   -- Darker Green
   red1 = "#545454",     -- Dark Red
   red2 = "#4A4A4A",     -- Darker Red
   black1 = "#474747",   -- Deep Black
   black2 = "#333333"    -- Darkest
}

local everforest = {
   red1 = "#f85552",
   red2 = "#e66868",
   red3 = "#FFE7DE",
   yellow = "#dfa000",
   green1 = "#8da101",
   green2 = "#93b259",
   green3 = "#F3F5D9",
   blue1 = "#3a94c5",
   blue2 = "#ECF5ED",
   cyan = "#35a77c",
   magenta1 = "#df69ba"
}

vim.cmd([[highlight clear]])
vim.opt.background = "light"

set_var("colors_name", "e-ink")
set_var("background", "light")
set_var("terminal_color_0", palette.bg)
set_var("terminal_color_1", palette.yellow1)
set_var("terminal_color_2", palette.cyan1)
set_var("terminal_color_3", palette.magenta1)
set_var("terminal_color_4", palette.blue1)
set_var("terminal_color_5", palette.green1)
set_var("terminal_color_6", palette.red1)
set_var("terminal_color_7", palette.black1)
set_var("terminal_color_8", palette.white)
set_var("terminal_color_9", palette.yellow2)
set_var("terminal_color_10", palette.cyan2)
set_var("terminal_color_11", palette.magenta2)
set_var("terminal_color_12", palette.blue2)
set_var("terminal_color_13", palette.green2)
set_var("terminal_color_14", palette.red2)
set_var("terminal_color_15", palette.black2)

set_hl(0, "ColorColumn", { link = "CursorLine" })
set_hl(0, "Comment", { fg = palette.magenta1, italic = true })
set_hl(0, "Constant", { link = "@variable" })
set_hl(0, "CurSearch", { fg = palette.red1, reverse = true })
set_hl(0, "CursorColumn", { link = "CursorLine" })
set_hl(0, "CursorLine", { bg = palette.white })
set_hl(0, "Delimiter", { fg = palette.black2 })
set_hl(0, "Directory", { fg = palette.black1 })
set_hl(0, "ErrorMsg", { fg = everforest.red1 })
set_hl(0, "FloatBorder", { fg = palette.blue2, bg = palette.bg })
set_hl(0, "Function", { fg = palette.black2 })
set_hl(0, "Identifier", { fg = palette.magenta2 })
set_hl(0, "MoreMsg", { fg = palette.black1 })
set_hl(0, "Normal", { fg = palette.green2, bg = palette.bg })
set_hl(0, "NormalFloat", { link = "Normal" })
set_hl(0, "Operator", { fg = palette.red2 })
set_hl(0, "Question", { link = "MoreMsg" })
set_hl(0, "QuickFixLine", { link = "MoreMsg" })
set_hl(0, "Search", { fg = palette.cyan2, reverse = true })
set_hl(0, "Special", { fg = palette.green1 })
set_hl(0, "SpellBad", { sp = everforest.red1, undercurl = true })
set_hl(0, "SpellCap", { sp = everforest.blue1, undercurl = true })
set_hl(0, "SpellLocal", { sp = everforest.green2, undercurl = true })
set_hl(0, "SpellRare", { sp = everforest.magenta1, undercurl = true })
set_hl(0, "Statement", { fg = palette.green2 })
set_hl(0, "StatusLine", { link = "Normal" })
set_hl(0, "StatusLineNC", { link = "Normal" })
set_hl(0, "String", { fg = palette.green1 })
set_hl(0, "Title", { fg = palette.black2 })
set_hl(0, "Type", { fg = palette.red })
set_hl(0, "Visual", { bg = palette.cyan1 })
set_hl(0, "WarningMsg", { fg = everforest.red1 })
set_hl(0, "WinSeparator", { fg = palette.blue1 })

set_hl(0, "Added", { fg = everforest.green1 })
set_hl(0, "Changed", { fg = everforest.blue1 })
set_hl(0, "Removed", { fg = everforest.red2 })

set_hl(0, "DiagnosticOk", { fg = everforest.green1 })
set_hl(0, "DiagnosticHint", { fg = everforest.blue1 })
set_hl(0, "DiagnosticInfo", { fg = everforest.cyan })
set_hl(0, "DiagnosticWarn", { fg = everforest.yellow })
set_hl(0, "DiagnosticError", { fg = everforest.red1 })

set_hl(0, "markdownLinkText", { underline = false })
set_hl(0, "markdownUrl", { underline = true })

set_hl(0, "DiffAdd", { bg = everforest.green3 })
set_hl(0, "DiffChange", { bg = everforest.blue2 })
set_hl(0, "DiffDelete", { bg = everforest.red3 })
set_hl(0, "DiffText", { bg = everforest.blue1 })

-- nvim-notify
set_hl(0, "NotifyInfoIcon", { link = "DiagnosticOk" })
set_hl(0, "NotifyWarnIcon", { link = "DiagnosticWarn" })
set_hl(0, "NotifyErrorIcon", { link = "DiagnosticError" })
set_hl(0, "NotifyInfoTitle", { link = "DiagnosticOk" })
set_hl(0, "NotifyWarnTitle", { link = "DiagnosticWarn" })
set_hl(0, "NotifyErrorTitle", { link = "DiagnosticError" })
set_hl(0, "NotifyInfoBorder", { link = "DiagnosticOk" })
set_hl(0, "NotifyWarnBorder", { link = "DiagnosticWarn" })
set_hl(0, "NotifyErrorBorder", { link = "DiagnosticError" })

-- treesitter
set_hl(0, "@variable", { fg = palette.black2 })
set_hl(0, "@markup.strong", { fg = palette.black2, bold = true })
set_hl(0, "@markup.link", { bold = true, underline = false })
set_hl(0, "@markup.link.label", { bold = true, underline = false })
set_hl(0, "@markup.link.url", { bold = false, underline = true })
set_hl(0, "@markup.quote", { fg = palette.magenta2 })

-- treesitter-context
set_hl(0, "TreesitterContextBottom", { underline = true })

-- eyeliner
set_hl(0, "EyelinerPrimary", { fg = palette.green2, bold = true, reverse = true })
set_hl(0, "EyelinerSecondary", { fg = palette.cyan2, bold = true, reverse = true })

-- FzfLua
set_hl(0, "FzfLuaBufNr", { fg = palette.cyan1 })
set_hl(0, "FzfLuaHeaderBind", { fg = palette.cyan1 })
set_hl(0, "FzfLuaPathLineNr", { fg = palette.cyan1 })
set_hl(0, "FzfLuaTabMarker", { fg = palette.black1 })
