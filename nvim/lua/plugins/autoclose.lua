return {
   "m4xshen/autoclose.nvim",
   event = "InsertEnter",
   config = function()
      require("autoclose").setup({
         options = {
            disabled_filetypes = { "text" },
            auto_indent = false,
         },
      })
   end,
}
