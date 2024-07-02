return {
   "folke/trouble.nvim",
   cmd = { "Trouble", "TroubleToggle" },
   dependencies = { "neovim/nvim-lspconfig" },
   config = function()
      local trouble = require("trouble")

      trouble.setup({
         auto_preview = false,
         indent_guides = true,
         keys = { ["<tab>"] = "preview" }
      })
   end,
}
