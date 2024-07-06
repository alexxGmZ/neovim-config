return {
   "ptdewey/darkearth-nvim",
   -- lazy = true,
   priority = 1000,
   dependencies = { "rktjmp/lush.nvim" },
   config = function ()
      vim.cmd.colorscheme "darkearth"
   end
}
