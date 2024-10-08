return {
   -- "alexxGmZ/player.nvim",
   dir = "$HOME/Git/player.nvim",
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
