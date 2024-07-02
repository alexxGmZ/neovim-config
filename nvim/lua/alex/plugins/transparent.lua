return {
   "xiyaowong/transparent.nvim",
   config = function()
      if vim.g.neovide then
         vim.cmd("TransparentDisable")
      end

      require("transparent").setup({
         exclude_groups = {},
      })
   end
}
