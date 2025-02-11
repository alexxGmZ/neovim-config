return {
   "jinh0/eyeliner.nvim",
   keys = { { "f" }, { "F" }, { "t" }, { "T" } },
   -- event = "VeryLazy",
   config = function ()
      require("eyeliner").setup({
         highlight_on_key = true,
         dim = false,
         default_keymaps = true
      })
   end
}
