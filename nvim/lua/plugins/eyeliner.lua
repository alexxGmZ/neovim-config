return {
   "jinh0/eyeliner.nvim",
   cmd = { "EyelinerEnable", "EyelinerToggle" },
   config = function ()
      require("eyeliner").setup({
         highlight_on_key = true,
         dim = true,
         default_keymaps = true
      })
   end
}
