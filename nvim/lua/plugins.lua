return {
   {
      "sitiom/nvim-numbertoggle",
      enabled = true,
      event = "VeryLazy",
   },

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
      ft = "help",
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      }
   }
}
