return {
   "rcarriga/nvim-notify",
   -- priority = 999,
   event = "VeryLazy",
   config = function()
      local notify = require("notify")

      notify.setup({
         background_colour = "NotifyBackground",
         -- background_colour = "#000000",
         fps = 30,
         icons = {
            DEBUG = " ",
            ERROR = "󰅙 ",
            INFO = "󰋼 ",
            TRACE = "✎ ",
            WARN = "󰀦 "
         },
         -- level = 0,
         level = vim.log.levels.INFO,
         minimum_width = 10,
         render = "default",
         stages = "fade",
         timeout = 1500,
         top_down = false
      })

      vim.notify = notify
   end
}
