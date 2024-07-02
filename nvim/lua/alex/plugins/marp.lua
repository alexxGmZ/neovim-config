return {
   "aca/marp.nvim",
   config = function()
      local api = vim.api

      api.nvim_create_user_command(
         "MarpStart",
         function() require("marp.nvim").ServerStart() end,
         {}
      )

      api.nvim_create_user_command(
         "MarpStop",
         function() require("marp.nvim").ServerStart() end,
         {}
      )
   end,
   cmd = "MarpStart"
}
