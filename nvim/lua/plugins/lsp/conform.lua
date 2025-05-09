return {
   "stevearc/conform.nvim",
   keys = {
      {
         "<leader>f",
         function()
            require("conform").format({
               async = true,
               lsp_format = "fallback"
            })
         end,
      }
   },
   config = function()
      require("conform").setup({
         formatters_by_ft = {
            blade = { "blade-formatter" },
            typst = { "typstyle" }
         },
      })
   end
}
