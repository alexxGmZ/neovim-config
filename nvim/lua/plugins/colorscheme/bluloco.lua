return {
   "uloco/bluloco.nvim",
   lazy = true,
   config = function()
      require("bluloco").setup({
         italics = false
      })
   end
}
