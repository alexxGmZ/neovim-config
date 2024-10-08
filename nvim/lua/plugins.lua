return {
   {
      "sitiom/nvim-numbertoggle",
      enabled = true,
      event = "VeryLazy",
   },

   {
      "gregsexton/MatchTag",
      ft = { 'markdown', 'html', 'php', 'xml', 'javascript' },
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
      "alexxGmZ/player.nvim",
      branch = "beta",
      config = function()
         require("player").setup({
            supported_players = {
               "cmus",
               "spotify",
               "firefox",
               "mpv",
               "vlc"
            }
         })
      end
   }
}
