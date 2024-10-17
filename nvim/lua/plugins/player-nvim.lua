return {
   -- "alexxGmZ/player.nvim",
   -- branch = "beta",
   dir = "$HOME/Git/player.nvim",
   -- cmd = "Player",
   event = "VeryLazy",
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
