return {
   "catppuccin/nvim",
   name = "catppuccin",
   -- priority = 1000,
   lazy = true,
   config = function()
      require("catppuccin").setup({
         flavour = "auto",
         background = {
            light = "latte",
            dark = "mocha",
         },
         styles = {
            properties = { "italic" },
            variables = { "bold" },
            booleans = { "bold" },
            numbers = { "bold" },
            keywords = { "italic" },
            functions = { "bold" },
            miscs = {},
         },
         custom_highlights = function(colors)
            return {
               ["@markup.heading.1.markdown"] = { fg = colors.red, bold = true },
               ["@markup.heading.2.markdown"] = { fg = colors.peach, bold = true },
               ["@markup.heading.3.markdown"] = { fg = colors.yellow, bold = true },
               ["@markup.heading.4.markdown"] = { fg = colors.green, bold = true },
               ["@markup.heading.5.markdown"] = { fg = colors.blue, bold = true },
               ["@markup.heading.6.markdown"] = { fg = colors.mauve, bold = true },
               ["@markup.quote.markdown"] = { fg = colors.text, bold = false },
               ["CursorLineNr"] = { fg = colors.yellow, bold = true },
               ["LineNr"] = { fg = colors.overlay0 },
               ["GitSignsCurrentLineBlame"] = { fg = colors.overlay0 },
               ["Keyword"] = { fg = colors.red, italic = true },
               ["@keyword.function"] = { fg = colors.red, italic = true },
               ["Boolean"] = { fg = colors.yellow },
               ["Function"] = { fg = colors.peach },
               ["Operator"] = { fg = colors.red },
               ["BufferLineBufferSelected"] = { fg = colors.peach, bold = true }
            }
         end
      })
      vim.cmd.colorscheme "catppuccin"
   end
}
