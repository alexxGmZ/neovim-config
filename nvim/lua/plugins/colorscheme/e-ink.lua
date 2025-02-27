local function highlight_overrides()
   local set_hl = vim.api.nvim_set_hl
   local mono = require("e-ink.palette").mono()
   -- local everforest = require("e-ink.palette").everforest()
   -- print(vim.inspect(mono))
   -- print(vim.inspect(everforest))

   -- transparent when dark background
   if vim.o.background == "dark" then
      set_hl(0, "Normal", { fg = mono[12], bg = "NONE" })
      set_hl(0, "NotifyBackground", { bg = mono[1] })
   end

   set_hl(0, "Function", { fg = mono[16], bold = true })
   set_hl(0, "@variable", { fg = mono[16], bold = true })
end

return {
   -- dir = "/home/alex/Git/e-ink.nvim",
   "alexxGmZ/e-ink.nvim",
   branch = "beta",
   priority = 1000,
   config = function()
      vim.cmd.colorscheme "e-ink"

      local time = tonumber(os.date("%H%M"))
      if time >= 1600 then
         vim.opt.background = "dark"
      else
         vim.opt.background = "light"
      end


      highlight_overrides()
      vim.api.nvim_create_autocmd("ColorScheme", {
         group = "HANDSOME",
         pattern = "*",
         callback = function()
            if vim.g.colors_name ~= "e-ink" then
               return
            end
            highlight_overrides()
         end
      })
   end
}
