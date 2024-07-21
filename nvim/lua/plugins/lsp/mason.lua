return {
   "williamboman/mason.nvim",
   cmd = { "Mason" },
   config = function()
      local status, mason = pcall(require, "mason")
      if not status then
         return
      end

      mason.setup({
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
