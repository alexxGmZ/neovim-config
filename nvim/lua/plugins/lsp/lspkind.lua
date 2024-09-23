return {
   "onsails/lspkind.nvim",
   event = { "InsertEnter", "LspAttach" },
   config = function()
      require("lspkind").init({
         -- DEPRECATED (use mode instead): enables text annotations
         --
         -- default: true
         -- with_text = true,

         -- defines how annotations are shown
         -- default: symbol
         -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
         mode = "symbol_text",

         -- default symbol map
         -- can be either 'default' (requires nerd-fonts font) or
         -- 'codicons' for codicon preset (requires vscode-codicons font)
         --
         -- default: 'default'
         preset = "default",

         -- override preset symbols
         --
         -- default: {}
      })

      -- highlight overrides
      vim.cmd [[
         highlight! default link CmpItemKindMatch          Boolean
         highlight! default link CmpItemKindMatchFuzzy     Boolean
         highlight! default link CmpItemKindText           Label
         highlight! default link CmpItemKindMethod         Function
         highlight! default link CmpItemKindFunction       Function
         highlight! default link CmpItemKindConstructor    Function
         highlight! default link CmpItemKindField          Type
         highlight! default link CmpItemKindVariable       Type
         highlight! default link CmpItemKindClass          Structure
         highlight! default link CmpItemKindInterface      Structure
         highlight! default link CmpItemKindModule         Structure
         highlight! default link CmpItemKindProperty       Type
         highlight! default link CmpItemKindUnit           Boolean
         highlight! default link CmpItemKindValue          Character
         highlight! default link CmpItemKindEnum           Structure
         highlight! default link CmpItemKindKeyword        Operator
         highlight! default link CmpItemKindSnippet        Special
         highlight! default link CmpItemKindColor          Constant
         highlight! default link CmpItemKindFile           String
         highlight! default link CmpItemKindReference      Character
         highlight! default link CmpItemKindFolder         String
         highlight! default link CmpItemKindEnumMember     Type
         highlight! default link CmpItemKindConstant       Constant
         highlight! default link CmpItemKindStruct         Structure
         highlight! default link CmpItemKindEvent          Conditional
         highlight! default link CmpItemKindOperator       Operator
         highlight! default link CmpItemKindTypeParameter  Special
      ]]
   end
}
