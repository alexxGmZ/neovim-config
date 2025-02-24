local function setup_config()
   require("everforest").setup({
      background = "hard",
      transparent_background_level = 0,
      italics = false,
      disable_italic_comments = false,
      sign_column_background = "none",
      ui_contrast = "high",
      dim_inactive_windows = false,
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = "coloured",
      diagnostic_line_highlight = false,
      spell_foreground = false,
      show_eob = false,
      float_style = "dim",
      on_highlights = function(hl, palette)
         hl.TSBoolean = { link = "Boolean" }
         hl.TSFloat = { link = "Float" }
         hl.TSNumber = { link = "Number" }
         hl.TSFunction = { link = "Function" }
         hl.TSFunctionCall = { link = "Function" }
         hl.TSKeyword = { link = "Keyword" }
         hl.TSParameter = { fg = palette.red, bold = true }
         hl.TSString = { link = "String" }
         hl.TSConditional = { fg = palette.red }
         hl.TSVariable = { fg = palette.none, bold = true }
         hl.TSMethod = { link = "Function" }
         hl.TSMethodCall = { link = "Function" }
         hl.TreesitterContextBottom = { underline = true }
         --
         hl.CurrentWord = { fg = palette.none, underline = true }
         hl.String = { fg = palette.green, bold = false }
         hl.Keyword = { fg = palette.orange }
         hl.Constant = { fg = palette.orange, bold = true }
         hl.Function = { fg = palette.orange, bold = true }
         hl.Boolean = { fg = palette.purple, bold = true }
         hl.Float = { fg = palette.purple, bold = true }
         hl.Number = { fg = palette.purple, bold = true }
         hl.NormalFloat = { bg = palette.bgdim }
         hl.FloatBorder = { bg = palette.bgdim }
         hl.FloatTitle = { bg = palette.bgdim }
         hl.luaFunc = { link = "Function" }
         hl.luaFunction = { link = "Function" }
         hl.vimFuncName = { link = "Function" }
         hl.vimFunction = { link = "Function" }
         hl.vimUserFunc = { link = "Function" }
         hl.EndOfBuffer = { link = "NonText" }

         hl.IlluminatedWordText = { link = "CurrentWord" }
         hl.IlluminatedWordRead = { link = "CurrentWord" }
         hl.IlluminatedWordWrite = { link = "CurrentWord" }

         hl.CursorLineNr = { fg = palette.green, bold = true }
         hl["@variable.builtin"] = { fg = palette.yellow, bold = true }
         hl["@module.builtin"] = { link = "@variable.builtin" }
         hl["@keyword.return"] = { fg = palette.orange }
         hl["@keyword.repeat"] = { fg = palette.red }
         hl["@keyword.function"] = { fg = palette.red }
         hl["@constant.builtin"] = { fg = palette.purple }
         hl.LazyReasonKeys = { fg = palette.red }
         hl.LazyReasonRequire = { fg = palette.red }
         hl.LazyReasonEvent = { fg = palette.orange }
         hl.LazyReasonImport = { fg = palette.blue }
         hl.LazyReasonPlugin = { fg = palette.yellow }
         hl.LazyReasonStart = { fg = palette.blue }
         hl.LazyCommitIssue = { fg = palette.orange }
         hl["@property"] = { fg = palette.blue }
         hl.EyelinerPrimary = { fg = palette.orange, bold = true, reverse = true }
         hl.EyelinerSecondary = { fg = palette.blue, bold = true, reverse = true }
         hl.NvimTreeNormal = { bg = palette.bgdim }
      end,
      colours_override = function(palette)
         -- palette.bg0 = "#402914"
         -- palette.yellow = palette.fg
         -- palette.orange = palette.fg
         -- palette.purple = palette.fg
         -- palette.green = palette.fg
         -- palette.blue = palette.fg
         -- palette.red = palette.fg
         -- palette.aqua = palette.fg
      end,
   })
   vim.cmd.colorscheme "everforest"
end

return {
   "neanias/everforest-nvim",
   -- priority = 1000,
   lazy = true,
   config = setup_config
}
