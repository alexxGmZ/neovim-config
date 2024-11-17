return {
   "williamboman/mason.nvim",
   cmd = { "Mason" },
   config = function()
      require("mason").setup({
         ui = {
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗"
            },
            border = "rounded",
         }
      })
   end
}
