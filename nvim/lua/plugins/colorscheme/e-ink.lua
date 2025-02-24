return {
   "alexxGmZ/e-ink.nvim",
   -- dir = "/home/alex/Git/e-ink.nvim",
   -- branch = "beta",
   priority = 1000,
   config = function()
      require("e-ink").setup()
      vim.cmd.colorscheme "e-ink"
   end
}
