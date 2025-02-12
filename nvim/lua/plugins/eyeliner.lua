return {
   "jinh0/eyeliner.nvim",
   keys = {
      { "f" },
      { "F" },
      { "t" },
      { "T" },
      { "f", mode = "v" },
      { "F", mode = "v" },
      { "t", mode = "v" },
      { "T", mode = "v" },
   },
   -- event = "VeryLazy",
   config = function ()
      require("eyeliner").setup({
         highlight_on_key = true,
         dim = false,
         default_keymaps = true
      })
   end
}
