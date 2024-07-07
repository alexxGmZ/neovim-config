return {
   "ptdewey/darkearth-nvim",
   -- lazy = true,
   priority = 1000,
   dependencies = { "rktjmp/lush.nvim" },
   config = function()
      vim.cmd.colorscheme "darkearth"

      -- highlight overrides
      local palette = {
         fg = "#D7C484",
         bg = "#24211E",
         red = "#B3664D",
         orange = "#BB7844",
         yellow = "#C9A654",
         green = "#77824A",
         blue = "#5F865F",
         brown = "#B36B42"
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
      set_hl(0, "ColorColumn", { link = "CursorLine" })
   end
}
