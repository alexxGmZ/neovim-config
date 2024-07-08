local function highlight_overrides()
   local palette = {
      fg = "#D7C484",
      bg = "#24211E",
      red = "#B3664D",
      orange = "#BB7844",
      yellow = "#C9A654",
      green = "#77824A",
      blue = "#5F865F",
      brown = "#B36B42",
      grey = "#6e665e"
   }
   local set_hl = vim.api.nvim_set_hl

   set_hl(0, "RainbowDelimiterRed", { fg = palette.red })
   set_hl(0, "RainbowDelimiterYellow", { fg = palette.yellow })
   set_hl(0, "RainbowDelimiterCyan", { fg = palette.green })
   set_hl(0, "RainbowDelimiterBlue", { fg = palette.blue })
   set_hl(0, "RainbowDelimiterOrange", { fg = palette.orange })
   set_hl(0, "Function", { fg = palette.orange, bold = true })
   set_hl(0, "String", { fg = palette.yellow, bold = true })
   set_hl(0, "Statement", { italic = true, bold = false })
   set_hl(0, "Keyword", { fg = palette.blue, italic = true })
   set_hl(0, "Identifier", { fg = palette.red, bold = true })
   set_hl(0, "@variable", { fg = palette.fg, bold = false })
   set_hl(0, "Number", { fg = palette.yellow, bold = true })
   set_hl(0, "Type", { fg = palette.orange, bold = false, italic = true })
   set_hl(0, "Constant", { bold = true })
   set_hl(0, "Field", { fg = palette.orange, bold = true })
   set_hl(0, "Operator", { fg = palette.orange, bold = true })
   set_hl(0, "CursorLine", { bg = "#221f1c" })
   set_hl(0, "ColorColumn", { link = "CursorLine" })
   set_hl(0, "SpellBad", { sp = palette.red, undercurl = true })
   set_hl(0, "Directory", { fg = palette.green })

   set_hl(0, "CursorLineNr", { fg = palette.yellow, bg = palette.bg, bold = true })
   set_hl(0, "LineNr", { fg = palette.grey })
   set_hl(0, "LineNrAbove", { link = "LineNr" })
   set_hl(0, "LineNrBelow", { link = "LineNr" })

   set_hl(0, "LuaLineDiffAdd", { fg = palette.blue, bold = true })
   set_hl(0, "LuaLineDiffChange", { fg = palette.yellow, bold = true })
   set_hl(0, "LuaLineDiffDelete", { fg = palette.red, bold = true })

   set_hl(0, "@markup.link.url", { fg = palette.yellow, bold = false })
   set_hl(0, "@markup.link.label", { fg = palette.fg, bold = true })
   set_hl(0, "@markup.heading.1.markdown", { fg = palette.red, bold = true })
   set_hl(0, "@markup.heading.2.markdown", { fg = palette.orange, bold = true })
   set_hl(0, "@markup.heading.3.markdown", { fg = palette.yellow, bold = true })
   set_hl(0, "@markup.heading.4.markdown", { fg = palette.green, bold = true })
   set_hl(0, "@markup.heading.5.markdown", { fg = palette.blue, bold = true })
   set_hl(0, "@markup.heading.6.markdown", { fg = palette.brown, bold = true })

   set_hl(0, "gitHash", { fg = palette.green, bold = true })
   set_hl(0, "DiffAdded", { fg = palette.green, bold = true })
   set_hl(0, "DiffRemoved", { fg = palette.red, bold = true })
   set_hl(0, "DiffAdd", { fg = palette.bg, bg = palette.green, bold = true, })
   set_hl(0, "DiffText", { fg = palette.bg, bg = palette.yellow, bold = true })
   set_hl(0, "DiffChange", { fg = palette.bg, bg = palette.blue, bold = true })
   set_hl(0, "DiffDelete", { fg = palette.bg, bg = palette.red, bold = true })

   set_hl(0, "htmlTagName", { fg = palette.red, italic = true })
   set_hl(0, "htmlArg", { fg = palette.green })

   set_hl(0, "DashboardHeader", { fg = palette.orange, bold = true })
   set_hl(0, "DashboardFooter", { fg = palette.yellow, bold = true })
   set_hl(0, "DashboardShortcut", { fg = palette.green, bold = true })

   set_hl(0, "LazyReasonCmd", { fg = palette.yellow, bold = true })
   set_hl(0, "LazyReasonEvent", { fg = palette.orange, bold = true })
   set_hl(0, "LazyReasonKeys", { fg = palette.red, bold = true })
   set_hl(0, "LazyReasonPlugin", { fg = palette.green, bold = true })
   set_hl(0, "LazyReasonFt", { fg = palette.blue, bold = true })

   set_hl(0, "NotifyBackground", { bg = palette.bg })
end

return {
   "ptdewey/darkearth-nvim",
   -- lazy = true,
   priority = 1000,
   dependencies = { "rktjmp/lush.nvim" },
   config = function()
      vim.cmd.colorscheme "darkearth"

      highlight_overrides()

      vim.api.nvim_create_autocmd("ColorScheme", {
         pattern = "*",
         group = "HANDSOME",
         callback = function()
            if vim.g.colors_name ~= "darkearth" then
               return
            end

            highlight_overrides()
         end
      })
   end
}
