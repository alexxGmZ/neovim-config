local function highlight_overrides()
   local set_hl = vim.api.nvim_set_hl
   local palette = {
      fg = "#cdcdcd",
      bg = "#18191a",
      dark_blue = "#465362",
      blue = "#7894ab",
      sky_blue = "#8ca0dc",
      light_blue = "#bad1ce",
      purple = "#b9a3ba",
      red = "#d2788c",
      rose_red = "#be8c8c",
      orange = "#d2a374",
      peach = "#deb896",
      yellow = "#e6be8c",
      green = "#8faf77"
   }

   set_hl(0, "RainbowDelimiterRed", { fg = palette.red })
   set_hl(0, "RainbowDelimiterYellow", { fg = palette.yellow })
   set_hl(0, "RainbowDelimiterCyan", { fg = palette.green })
   set_hl(0, "RainbowDelimiterBlue", { fg = palette.blue })
   set_hl(0, "RainbowDelimiterOrange", { fg = palette.orange })

   set_hl(0, "LazyDimmed", { link = "Comment" })
   set_hl(0, "LazyCommit", { fg = palette.yellow, bold = true })
   set_hl(0, "LazyCommitType", { fg = palette.red, bold = true })
   set_hl(0, "LazyProp", { fg = palette.blue, bold = true })

   set_hl(0, "EndOfBuffer", { fg = palette.dark_blue })
   set_hl(0, "@function.call", { link = "@function" })
end
return {
   "vague2k/vague.nvim",
   priority = 1000,
   -- lazy = true,
   config = function()
      require("vague").setup({
         transparent = true,
         style = {
            boolean = "bold",
            number = "bold",
            float = "bold",
            error = "none",
            comments = "italic",
            conditionals = "italic",
            functions = "bold",
            headings = "bold",
            operators = "none",
            strings = "none",
            variables = "bold",

            keywords = "italic",
            keyword_return = "italic",
            keywords_loop = "italic",
            keywords_label = "none",
            keywords_exception = "none",

            builtin_constants = "bold",
            builtin_functions = "bold",
            builtin_types = "none",
            builtin_variables = "none",
         }
      })
      vim.cmd.colorscheme "vague"
      highlight_overrides()
      vim.api.nvim_create_autocmd("ColorScheme", {
         pattern = "*",
         group = "HANDSOME",
         callback = function()
            if vim.g.colors_name ~= "darkearth" then
               return
            end

            highlight_overrides()
         end
      })
   end
}
