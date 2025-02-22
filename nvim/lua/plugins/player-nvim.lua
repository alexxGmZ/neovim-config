return {
   "alexxGmZ/player.nvim",
   branch = "beta",
   cmd = "Player",
   keys = {
      { "<leader>pn", "<cmd>Player next<CR>", desc = "Player: Next track" },
      { "<leader>pp", "<cmd>Player play-pause<CR>", desc = "Player: Play-pause" },
      { "<leader>pv", "<cmd>Player previous<CR>", desc = "Player: Previous track" },
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
         notify_now_playing = false
      })
   end
}
