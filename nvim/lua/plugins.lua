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
      opts = {
         max_recents = 30, -- Configure recent icons limit
         add_default_keybindings = false, -- Add default keybindings
         use_new_command = true, -- Enable new command system
      }
   },
}
