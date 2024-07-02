return {
   "uloco/bluloco.nvim",
   event = "CmdlineChanged",
   config = function()
      require("bluloco").setup({
         italics = false
      })
   end
}
