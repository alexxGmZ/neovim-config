return {
   "mcchrish/zenbones.nvim",
   lazy = true,
   dependencies = {
      "rktjmp/lush.nvim"
   },
   config = function()
      -- vim.cmd.colorscheme "forestbones"
      vim.g.forestbones = {
         transparent_background = true
      }
   end
}
