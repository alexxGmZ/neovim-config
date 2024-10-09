return {
   -- "alexxGmZ/player.nvim",
   -- branch = "beta",
   dir = "$HOME/Git/player.nvim",
   cmd = "Player",
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
