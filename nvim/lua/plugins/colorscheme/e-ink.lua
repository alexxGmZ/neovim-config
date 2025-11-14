local function highlight_overrides()
   local set_hl = vim.api.nvim_set_hl
   local mono = require("e-ink.palette").mono()
   local everforest = require("e-ink.palette").everforest()
   -- print(vim.inspect(mono))
   -- print(vim.inspect(everforest))

   -- transparent when dark background
   -- if vim.o.background == "dark" then
   --    set_hl(0, "Normal", { fg = mono[12], bg = "NONE" })
   --    set_hl(0, "NotifyBackground", { bg = mono[1] })
   -- end

   set_hl(0, "EyelinerPrimary", { fg = everforest.orange, reverse = true, bold = true })
   set_hl(0, "EyelinerSecondary", { fg = everforest.blue, reverse = true, bold = true })
   set_hl(0, "Function", { fg = mono[16], bold = true })
   set_hl(0, "@variable", { fg = mono[16], bold = true })
   set_hl(0, "Pmenu", { link = "NormalFloat" })
   set_hl(0, "Type", { fg = mono[13], bold = true })

   set_hl(0, "@markup.list.checked", { fg = everforest.green, bold = true })
   set_hl(0, "@markup.list.unchecked", { fg = everforest.red, bold = true })
end

return {
   -- dir = "/home/al/Git/e-ink.nvim",
   "e-ink-colorscheme/e-ink.nvim",
   -- branch = "beta",
   -- priority = 1000,
   lazy = true,
   config = function()
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
