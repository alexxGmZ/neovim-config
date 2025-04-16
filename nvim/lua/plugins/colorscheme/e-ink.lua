local function highlight_overrides()
   local set_hl = vim.api.nvim_set_hl
   local mono = require("e-ink.palette").mono()
   local everforest = require("e-ink.palette").everforest()
   -- print(vim.inspect(mono))
   -- print(vim.inspect(everforest))

   -- transparent when dark background
   if vim.o.background == "dark" then
      set_hl(0, "Normal", { fg = mono[12], bg = "NONE" })
      set_hl(0, "NotifyBackground", { bg = mono[1] })
   end

   set_hl(0, "EyelinerPrimary", { fg = everforest.orange, reverse = true, bold = true })
   set_hl(0, "EyelinerSecondary", { fg = everforest.blue, reverse = true, bold = true })
   set_hl(0, "Function", { fg = mono[16], bold = true })
   set_hl(0, "@variable", { fg = mono[16], bold = true })
   set_hl(0, "Pmenu", { link = "NormalFloat" })
   set_hl(0, "Type", { fg = mono[13], bold = true })

   set_hl(0, "LazyCommitIssue", { fg = everforest.orange, bold = true })
   set_hl(0, "LazyReasonCmd", { fg = everforest.yellow })
   set_hl(0, "LazyReasonEvent", { fg = everforest.orange })
   set_hl(0, "LazyReasonFt", { fg = everforest.green })
   set_hl(0, "LazyReasonImport", { fg = everforest.blue })
   set_hl(0, "LazyReasonIssue", { fg = everforest.orange })
   set_hl(0, "LazyReasonKeys", { fg = everforest.red })
   set_hl(0, "LazyReasonPlugin", { fg = everforest.yellow })
   set_hl(0, "LazyReasonRequire", { fg = everforest.red })
   set_hl(0, "LazyReasonSource", { fg = everforest.aqua })
   set_hl(0, "LazyReasonStart", { fg = everforest.blue })
end

return {
   -- dir = "/home/alex/Git/e-ink/nvim",
   "alexxGmZ/e-ink.nvim",
   -- branch = "beta",
   -- priority = 1000,
   lazy = true,
   config = function()
      vim.cmd.colorscheme "e-ink"
      vim.opt.background = "light"

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
