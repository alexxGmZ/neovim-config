return {
  "folke/trouble.nvim",
  event = "LspAttach",
  cmd = { "Trouble", "TroubleToggle" },
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local trouble = require("trouble")

    trouble.setup {
      position = "right",
      auto_preview = false,
      width = 40,
      use_diagnostic_signs = true
    }
  end,
}
