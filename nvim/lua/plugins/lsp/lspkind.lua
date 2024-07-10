return {
   "onsails/lspkind.nvim",
   event = { "InsertEnter", "LspAttach" },
   config = function()
      require('lspkind').init({
         -- DEPRECATED (use mode instead): enables text annotations
         --
         -- default: true
         -- with_text = true,

         -- defines how annotations are shown
         -- default: symbol
         -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
         mode = 'symbol_text',

         -- default symbol map
         -- can be either 'default' (requires nerd-fonts font) or
         -- 'codicons' for codicon preset (requires vscode-codicons font)
         --
         -- default: 'default'
         preset = 'default',

         -- override preset symbols
         --
         -- default: {}
      })
   end
}
