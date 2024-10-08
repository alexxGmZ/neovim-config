return {
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
