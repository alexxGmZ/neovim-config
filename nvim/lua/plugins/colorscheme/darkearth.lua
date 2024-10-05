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
      grey = "#6e665e",

      -- custom palette
      forest_green = "#1F2D0E",
      dark_charcoal = "#2B3136",
      deep_terracotta = "#5C2F1E",
      deep_goldenrod = "#A78C3E"
   }
   local set_hl = vim.api.nvim_set_hl

   set_hl(0, "RainbowDelimiterRed", { fg = palette.red })
   set_hl(0, "RainbowDelimiterYellow", { fg = palette.yellow })
   set_hl(0, "RainbowDelimiterCyan", { fg = palette.green })
   set_hl(0, "RainbowDelimiterBlue", { fg = palette.blue })
   set_hl(0, "RainbowDelimiterOrange", { fg = palette.orange })

   -- global syntax
   set_hl(0, "Function", { fg = palette.orange, bold = true })
   set_hl(0, "String", { fg = palette.yellow })
   set_hl(0, "Statement", { italic = true, bold = false })
   set_hl(0, "Keyword", { fg = palette.blue, italic = true })
   set_hl(0, "Identifier", { fg = palette.red, bold = true })
   set_hl(0, "@variable", { fg = palette.fg, bold = true })
   set_hl(0, "Number", { fg = palette.orange, bold = true })
   set_hl(0, "Type", { fg = palette.orange, bold = false, italic = true })
   set_hl(0, "Constant", { fg = palette.yellow, bold = true })
   set_hl(0, "Field", { fg = palette.orange, bold = true })
   set_hl(0, "Operator", { fg = palette.brown })
   set_hl(0, "@parameter", { fg = palette.green, bold = true })
   set_hl(0, "TSParameter", { link = "@parameter" })
   set_hl(0, "@variable.parameter", { link = "@parameter" })
   set_hl(0, "Boolean", { fg = palette.green, bold = true })
   set_hl(0, "Delimiter", { fg = palette.fg })
   set_hl(0, "@punctuation.special", { fg = palette.green, bold = true })
   set_hl(0, "@punctuation.delimiter.jsdoc", { link = "Comment" })
   set_hl(0, "@constructor.lua", { link = "@variable" })

   -- UI
   set_hl(0, "VertSplit", { fg = palette.grey })
   set_hl(0, "EndOfBuffer", { fg = palette.grey })
   set_hl(0, "ColorColumn", { link = "CursorLine" })
   set_hl(0, "SpellBad", { sp = palette.red, undercurl = true })
   set_hl(0, "SpellCap", { sp = palette.green, undercurl = true })
   set_hl(0, "Directory", { fg = palette.green })
   set_hl(0, "Visual", { bg = palette.dark_charcoal })
   set_hl(0, "Search", { fg = palette.bg, bg = palette.grey, bold = true })
   set_hl(0, "CurSearch", { fg = palette.bg, bg = palette.blue, bold = true })
   set_hl(0, "CursorLine", { bg = "#221f1c" })
   set_hl(0, "CursorLineNr", { fg = palette.yellow, bg = palette.bg, bold = true })
   set_hl(0, "LineNr", { fg = palette.grey })
   set_hl(0, "LineNrAbove", { link = "LineNr" })
   set_hl(0, "LineNrBelow", { link = "LineNr" })

   -- diagnostics
   set_hl(0, "DiagnosticHint", { fg = palette.blue })
   set_hl(0, "DiagnosticInfo", { fg = palette.green })
   set_hl(0, "DiagnosticWarn", { fg = palette.yellow })
   set_hl(0, "DiagnosticError", { fg = palette.red })
   set_hl(0, "DiagnosticSignHint", { fg = palette.blue })
   set_hl(0, "DiagnosticSignInfo", { fg = palette.green })
   set_hl(0, "DiagnosticSignWarn", { fg = palette.yellow })
   set_hl(0, "DiagnosticSignError", { fg = palette.red })
   set_hl(0, "DiagnosticUnderlineError", { fg = palette.red, undercurl = true })

   -- lualine
   set_hl(0, "LuaLineDiffAdd", { fg = palette.blue, bold = true })
   set_hl(0, "LuaLineDiffChange", { fg = palette.yellow, bold = true })
   set_hl(0, "LuaLineDiffDelete", { fg = palette.red, bold = true })

   -- markdown
   set_hl(0, "@markup.link.url", { fg = palette.yellow, bold = false })
   set_hl(0, "@markup.link.label", { fg = palette.fg })
   set_hl(0, "@markup.heading.1.markdown", { fg = palette.red, bold = true })
   set_hl(0, "@markup.heading.2.markdown", { fg = palette.orange, bold = true })
   set_hl(0, "@markup.heading.3.markdown", { fg = palette.yellow, bold = true })
   set_hl(0, "@markup.heading.4.markdown", { fg = palette.green, bold = true })
   set_hl(0, "@markup.heading.5.markdown", { fg = palette.blue, bold = true })
   set_hl(0, "@markup.heading.6.markdown", { fg = palette.brown, bold = true })
   set_hl(0, "markdownH1", { link = "@markup.heading.1.markdown" })
   set_hl(0, "markdownH2", { link = "@markup.heading.2.markdown" })
   set_hl(0, "markdownH3", { link = "@markup.heading.3.markdown" })
   set_hl(0, "markdownH4", { link = "@markup.heading.4.markdown" })
   set_hl(0, "markdownH5", { link = "@markup.heading.5.markdown" })
   set_hl(0, "markdownH6", { link = "@markup.heading.6.markdown" })

   -- git
   set_hl(0, "gitHash", { fg = palette.green, bold = true })
   set_hl(0, "DiffAdded", { fg = palette.green, bold = true })
   set_hl(0, "DiffRemoved", { fg = palette.red, bold = true })
   set_hl(0, "DiffAdd", { bg = palette.forest_green, bold = true, })
   set_hl(0, "DiffText", { fg = palette.bg, bg = palette.deep_goldenrod, bold = true })
   set_hl(0, "DiffChange", { bg = palette.dark_charcoal, bold = true })
   set_hl(0, "DiffDelete", { bg = palette.deep_terracotta, bold = true })
   set_hl(0, "fugitiveHeader", { bold = true })
   set_hl(0, "gitIdentityHeader", { fg = palette.fg })
   set_hl(0, "gitDateHeader", { link = "gitIdentityHeader" })
   set_hl(0, "@keyword.gitcommit", { fg = palette.yellow, bold = true })

   -- html
   set_hl(0, "htmlTagName", { fg = palette.red, italic = true })
   set_hl(0, "htmlArg", { fg = palette.green })

   -- dashboard
   set_hl(0, "DashboardHeader", { fg = palette.orange, bold = true })
   set_hl(0, "DashboardFooter", { fg = palette.yellow, bold = true })
   set_hl(0, "DashboardShortcut", { fg = palette.green, bold = true })

   -- lazy
   set_hl(0, "LazyReasonCmd", { fg = palette.yellow })
   set_hl(0, "LazyReasonEvent", { fg = palette.orange })
   set_hl(0, "LazyReasonKeys", { fg = palette.red })
   set_hl(0, "LazyReasonPlugin", { fg = palette.green })
   set_hl(0, "LazyReasonFt", { fg = palette.blue })
   set_hl(0, "LazyReasonSource", { fg = palette.yellow, bold = false })
   set_hl(0, "LazyReasonImport", { fg = palette.red, bold = false })

   -- notify
   set_hl(0, "NotifyBackground", { bg = palette.bg })

   -- treesitter-context
   set_hl(0, "TreesitterContextBottom", { underline = true })

   -- javascript
   set_hl(0, "@variable.member.javascript", { fg = palette.fg })
   set_hl(0, "@variable.builtin.javascript", { fg = palette.fg, italic = true })
   set_hl(0, "@punctuation.delimiter.javascript", { link = "Delimiter" })
   set_hl(0, "@punctuation.bracket.javascript", { fg = palette.fg, bold = true })

   -- lua
   set_hl(0, "@variable.member.lua", { fg = palette.fg, italic = true })
   set_hl(0, "@constructor.lua", { link = "@variable" })
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
