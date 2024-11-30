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
      config = function()
         require("nvim-surround").setup({})
      end
   },

   {
      "nullchilly/fsread.nvim",
      cmd = { "FSRead", "FSToggle" }
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
      config = function()
         require("csvview").setup()
      end
   },

   {
      "lukas-reineke/indent-blankline.nvim",
      cmd = "IBLEnable",
      main = "ibl",
      config = function()
         require("ibl").setup()
      end
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
   }
}
