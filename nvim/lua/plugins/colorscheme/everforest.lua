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
         -- hl.TSBoolean = { link = "Boolean" }
         -- hl.TSFloat = { link = "Float" }
         -- hl.TSNumber = { link = "Number" }
         -- hl.TSFunction = { link = "Function" }
         -- hl.TSFunctionCall = { link = "Function" }
         -- hl.TSKeyword = { link = "Keyword" }
         -- hl.TSParameter = { fg = palette.red, bold = true }
         -- hl.TSString = { link = "String" }
         -- hl.TSConditional = { fg = palette.red, italic = true }
         -- hl.TSVariable = { fg = palette.none, bold = true }
         -- hl.TSMethod = { link = "Function" }
         -- hl.TSMethodCall = { link = "Function" }
         hl.TreesitterContextBottom = { underline = true }
         --
         hl.CurrentWord = { fg = palette.none, underline = true }
         -- hl.String = { fg = palette.green, bold = false }
         -- hl.Keyword = { fg = palette.orange, italic = true }
         -- hl.Constant = { fg = palette.orange, bold = true }
         -- hl.Function = { fg = palette.orange, bold = true }
         -- hl.Boolean = { fg = palette.purple, bold = true }
         -- hl.Float = { fg = palette.purple, bold = true }
         -- hl.Number = { fg = palette.purple, bold = true }
         hl.NormalFloat = { bg = palette.bgdim }
         hl.FloatBorder = { bg = palette.bgdim }
         hl.FloatTitle = { bg = palette.bgdim }
         -- hl.luaFunc = { link = "Function" }
         -- hl.luaFunction = { link = "Function" }
         -- hl.vimFuncName = { link = "Function" }
         -- hl.vimFunction = { link = "Function" }
         -- hl.vimUserFunc = { link = "Function" }

         hl.IlluminatedWordText = { link = "CurrentWord" }
         hl.IlluminatedWordRead = { link = "CurrentWord" }
         hl.IlluminatedWordWrite = { link = "CurrentWord" }

         -- hl.CursorLineNr = { fg = palette.green, bold = true }
         -- hl["@variable.builtin"] = { fg = palette.yellow, bold = true }
         -- hl["@module.builtin"] = { link = "@variable.builtin" }
         -- hl["@keyword.return"] = { fg = palette.orange, italic = true }
         -- hl["@keyword.repeat"] = { fg = palette.red, italic = true }
         -- hl["@keyword.function"] = { fg = palette.red, italic = true }
         -- hl["@constant.builtin"] = { fg = palette.purple, italic = true }
         hl.LazyReasonKeys = { fg = palette.red }
         hl.LazyReasonRequire = { fg = palette.red }
         hl.LazyReasonEvent = { fg = palette.orange }
         hl.LazyReasonImport = { fg = palette.blue }
         hl.LazyReasonPlugin = { fg = palette.yellow }
         hl.LazyReasonStart = { fg = palette.blue }
         hl.LazyCommitIssue = { fg = palette.orange }
         -- hl["@property"] = { fg = palette.blue, italic = true }
         hl.EyelinerPrimary = { fg = palette.orange, bold = true, reverse = true }
         hl.EyelinerSecondary = { fg = palette.blue, bold = true, reverse = true }

         -- mono-chrome override
         -- for group, _ in pairs(hl) do
         --    hl[group] = { fg = palette.fg }
         -- end
         hl["@boolean"] = { fg = palette.fg }
         hl["@conditional"] = { fg = palette.fg }
         hl["@constant"] = { fg = palette.fg }
         hl["@constant.builtin"] = { link = "@constant" }
         hl["@function"] = { fg = palette.fg }
         hl["@function.builtin"] = { link = "@function" }
         hl["@function.call"] = { link = "@function" }
         hl["@function.method"] = { link = "@function" }
         hl["@function.method.call"] = { link = "@function" }
         hl["@keyword"] = { fg = palette.fg }
         hl["@keyword.conditional"] = { link = "@keyword" }
         hl["@keyword.function"] = { link = "@keyword" }
         hl["@keyword.import"] = { link = "@keyword" }
         hl["@keyword.import.typescript"] = { link = "@keyword" }
         hl["@keyword.operator"] = { link = "@keyword" }
         hl["@keyword.repeat"] = { link = "@keyword" }
         hl["@keyword.return"] = { link = "@keyword" }
         hl["@label"] = { fg = palette.fg }
         hl["@module"] = { fg = palette.fg }
         hl["@module.builtin"] = { link = "@module" }
         hl["@number"] = { fg = palette.fg }
         hl["@operator"] = { fg = palette.fg }
         hl["@property"] = { fg = palette.fg }
         hl["@string"] = { fg = palette.fg }
         hl["@string.escape"] = { link = "@string" }
         hl["@string.regexp"] = { link = "@string" }
         hl["@type"] = { link = "@keyword" }
         hl["@variable"] = { fg = palette.fg }
         hl["@variable.member"] = { link = "@variable" }
         hl["@variable.builtin"] = { link = "@variable" }

         hl["Boolean"] = { link = "@boolean" }
         hl["Conditional"] = { link = "@conditional" }
         hl["Define"] = { link = "@variable" }
         hl["Function"] = { link = "@function" }
         hl["Identifier"] = { link = "@keyword" }
         hl["Include"] = { link = "Define" }
         hl["Keyword"] = { link = "@keyword" }
         hl["Label"] = { link = "@label" }
         hl["Macro"] = { link = "@keyword" }
         hl["Number"] = { link = "@number" }
         hl["PreCondit"] = { link = "@keyword" }
         hl["PreProc"] = { link = "@keyword" }
         hl["Special"] = { link = "@keyword" }
         hl["Statement"] = { link = "@keyword" }
         hl["StorageClass"] = { link = "@keyword" }
         hl["String"] = { link = "@string" }
         hl["Structure"] = { link = "@keyword" }
         hl["Tag"] = { link = "@string" }
         hl["Type"] = { link = "@type" }
         hl["Typedef"] = { link = "@keyword" }

         hl["gitcommitDiscardedFile"] = { link = "@string" }
         hl["gitcommitSelectedFile"] = { link = "@string" }
         hl["gitcommitSummary"] = { link = "@string" }
         hl["gitcommitUntrackedFile"] = { link = "@string" }
         hl["goBuiltins"] = { link = "@keyword" }
         hl["goConditional"] = { link = "@conditional" }
         hl["goDeclType"] = { link = "@type" }
         hl["goFormatSpecifier"] = { link = "@string" }
         hl["goPredefinedIdentifiers"] = { link = "Identifier" }
         hl["goRepeat"] = { link = "@keyword" }
         hl["goSignedInts"] = { link = "@variable" }
         hl["goType"] = { link = "@type" }
         hl["goVar"] = { link = "@variable" }
         hl["javaClassDecl"] = { link = "@keyword" }
         hl["javaExceptions"] = { link = "@keyword" }
         hl["javaMethodDecl"] = { link = "@keyword" }
         hl["javaOperator"] = { link = "@operator" }
         hl["javaRepeat"] = { link = "@keyword" }
         hl["javaSpecialChar"] = { link = "@string" }
         hl["javaScriptBoolean"] = { link = "@boolean" }
         hl["javaScriptBraces"] = { link = "@operator" }
         hl["javaScriptConditional"] = { link = "@conditional" }
         hl["javaScriptEmbed"] = { link = "@string" }
         hl["javaScriptException"] = { link = "@keyword" }
         hl["javaScriptGlobal"] = { link = "@member" }
         hl["javaScriptIdentifier"] = { link = "Identifier" }
         hl["javaScriptMember"] = { link = "@property" }
         hl["javaScriptMessage"] = { link = "@function" }
         hl["javaScriptNull"] = { link = "@number" }
         hl["javaScriptNumber"] = { link = "@number" }
         hl["javaScriptOperator"] = { link = "@operator" }
         hl["jsonKeyword"] = { link = "@keyword" }
         hl["markdownCode"] = { fg = palette.fg }
         hl["markdownCodeBlock"] = { link = "markdownCode" }
         hl["markdownCodeDelimiter"] = { link = "markdownCode" }
         hl["markdownH1"] = { fg = palette.fg, bold = true }
         hl["markdownH2"] = { link = "markdownH1" }
         hl["markdownH3"] = { link = "markdownH1" }
         hl["markdownH4"] = { link = "markdownH1" }
         hl["markdownH5"] = { link = "markdownH1" }
         hl["markdownH6"] = { link = "markdownH1" }
         hl["markdownLinkText"] = { fg = palette.fg }
         hl["markdownListMarker"] = { link = "Grey" }
         hl["markdownOrderedListMarker"] = { link = "markdownListMarker" }
         hl["markdownUrl"] = { fg = palette.fg }
         hl["pythonBuiltin"] = { link = "@keyword" }
         hl["pythonOperator"] = { link = "@operator" }
         hl["pythonRepeat"] = { link = "@keyword" }
         hl["shCmdSubRegion"] = { link = "@string" }
         hl["shConditional"] = { link = "@conditional" }
         hl["shCommandSub"] = { link = "@string" }
         hl["shOperator"] = { link = "@operator" }
         hl["shOption"] = { link = "@keyword" }
         hl["shQuote"] = { link = "@string" }
         hl["shSet"] = { link = "@keyword" }
         hl["shSetList"] = { link = "@keyword" }
         hl["shSnglCase"] = { link = "@operator" }
         hl["shTestOpr"] = { link = "@operator" }
         hl["shVarAssign"] = { link = "@operator" }
         hl["shVariable"] = { link = "@variable" }
         hl["yamlBlockMappingKey"] = { link = "@property" }
         hl["zshDeref"] = { link = "@variable" }
         hl["zshOptStart"] = { link = "@keyword" }
         hl["zshOption"] = { link = "@keyword" }
         hl["zshTypes"] = { link = "@type" }
         hl["zshVariableDef"] = { link = "@variable" }
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
   priority = 1000,
   -- lazy = true,
   config = setup_config
}
