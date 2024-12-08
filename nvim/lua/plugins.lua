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
      "lukas-reineke/indent-blankline.nvim",
      cmd = "IBLEnable",
      main = "ibl",
   },

   {
      "2kabhishek/nerdy.nvim",
      dependencies = {
         "stevearc/dressing.nvim",
      },
      cmd = "Nerdy",
   },

   {
      "sudoerwx/vim-ray-so-beautiful",
      cmd = { "Ray" }
   },

   {
      "NStefan002/screenkey.nvim",
      cmd = "Screenkey",
      version = "*", -- or branch = "dev", to use the latest commit
   },

   {
      "OXY2DEV/helpview.nvim",
      ft = "help",
      dependencies = {
         "nvim-treesitter/nvim-treesitter"
      }
   }
}
