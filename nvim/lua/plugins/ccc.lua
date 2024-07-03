return {
   "uga-rosa/ccc.nvim",
   keys = {
      { "<leader>cp", "<cmd>CccPick<CR>", desc = "Ccc: Color Picker" }
   },
   config = function()
      local ccc = require("ccc")
      local mapping = ccc.mapping

      ccc.setup({
         highlighter = { auto_enable = true, lsp = true },
         inputs = {
            ccc.input.rgb,
            ccc.input.hsl,
            ccc.input.cmyk
         }
      })
   end,
   -- ft = { "markdown", "html", "php", "javascript", "css" }
   cmd = { "CccHighlighterToggle", "CccHighlighterEnable", "CccPick" }
}
