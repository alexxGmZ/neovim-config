return {
   "alexxGmZ/player.nvim",
   branch = "beta",
   -- dir = "$HOME/Git/player.nvim",
   -- cmd = "Player",
   event = "VeryLazy",
   keys = {
      { "<leader>pn", "<cmd>Player next<CR>", desc = "Player: Next track" },
      { "<leader>pp", "<cmd>Player play-pause<CR>", desc = "Player: Play-pause" }
   },
   config = function()
      require("player").setup({
         supported_players = {
            "cmus",
            "spotify",
            "firefox",
            "mpv",
            "vlc"
         },
         notify_now_playing = true
      })
   end
}
