return {
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = true
   },

   {
      "numToStr/Comment.nvim",
      event = "VeryLazy",
      config = function()
         require("Comment").setup({})
      end
   },

   {
      "hat0uma/csvview.nvim",
      cmd = { "CsvViewEnable", "CsvViewToggle" },
      config = true
   },

   {
      "2kabhishek/nerdy.nvim",
      dependencies = {
         "stevearc/dressing.nvim",
      },
      cmd = "Nerdy",
   },

   {
      "OXY2DEV/helpview.nvim",
      lazy = false,
      opts = {
         preview = {
            icon_provider = "devicons",
         }
      },
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      }
   }
}
