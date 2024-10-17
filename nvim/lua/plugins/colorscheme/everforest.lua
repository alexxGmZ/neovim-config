local function setup_config()
   require("everforest").setup({
      background = "hard",
      transparent_background_level = 0,
      italics = true,
      disable_italic_comments = false,
      sign_column_background = "none",
      ui_contrast = "high",
      dim_inactive_windows = false,
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = "coloured",
      diagnostic_line_highlight = false,
      spell_foreground = false,
      show_eob = true,
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
         hl.TSConditional = { fg = palette.red, italic = true }
         hl.TSVariable = { fg = palette.none, bold = true }
         hl.TSMethod = { link = "Function" }
         hl.TSMethodCall = { link = "Function" }
         hl.TreesitterContextBottom = { underline = true }

         hl.CurrentWord = { fg = palette.none, underline = true }
         hl.String = { fg = palette.green, bold = false }
         hl.Keyword = { fg = palette.orange, italic = true }
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

         hl.IlluminateWordText = { bg = "#4e4e4e" }
         hl.IlluminateWordRead = { bg = "#4e4e4e" }
         hl.IlluminateWordWrite = { bg = "#4e4e4e" }

         hl.CursorLineNr = { fg = palette.green, bold = true }
         hl["@variable.builtin"] = { fg = palette.yellow, bold = true }
         hl["@module.builtin"] = { link = "@variable.builtin" }
         hl["@keyword.return"] = { fg = palette.orange, italic = true }
         hl["@keyword.repeat"] = { fg = palette.red, italic = true }
         hl["@keyword.function"] = { fg = palette.red, italic = true }
         hl["@punctuation.bracket"] = { bold = true }
         hl["@punctuation.delimiter"] = { bold = true }
         hl["@constant.builtin"] = { fg = palette.purple, italic = true }
         hl.LazyReasonKeys = { fg = palette.red }
      end,
      colours_override = function(palette)
         -- palette.bg0 = "#402914"
         -- palette.yellow = "#e1d56a"
         -- palette.orange = "#ffaf65"
         -- palette.purple = "#de7398"
      end,
   })
   vim.cmd.colorscheme "everforest"
end

return {
   "neanias/everforest-nvim",
   priority = 1000,
   -- lazy = true,
   config = setup_config
}
