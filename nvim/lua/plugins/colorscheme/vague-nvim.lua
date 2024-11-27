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

local function highlight_overrides()
   local set_hl = vim.api.nvim_set_hl

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

   set_hl(0, "@markup.link.url", { fg = palette.light_blue, italic = true, underline = true })
   set_hl(0, "@markup.link.label", { fg = palette.rose_red })
   set_hl(0, "@markup.heading.1.markdown", { fg = palette.red, bold = true })
   set_hl(0, "@markup.heading.2.markdown", { fg = palette.orange, bold = true })
   set_hl(0, "@markup.heading.3.markdown", { fg = palette.green, bold = true })
   set_hl(0, "@markup.heading.4.markdown", { fg = palette.yellow, bold = true })
   set_hl(0, "@markup.heading.5.markdown", { fg = palette.blue, bold = true })
   set_hl(0, "@markup.heading.6.markdown", { fg = palette.brown, bold = true })
   set_hl(0, "markdownH1", { link = "@markup.heading.1.markdown" })
   set_hl(0, "markdownH2", { link = "@markup.heading.2.markdown" })
   set_hl(0, "markdownH3", { link = "@markup.heading.3.markdown" })
   set_hl(0, "markdownH4", { link = "@markup.heading.4.markdown" })
   set_hl(0, "markdownH5", { link = "@markup.heading.5.markdown" })
   set_hl(0, "markdownH6", { link = "@markup.heading.6.markdown" })

   set_hl(0, "SpellBad", { sp = palette.red, undercurl = true })
   set_hl(0, "SpellCap", { sp = palette.green, undercurl = true })

   set_hl(0, "EyelinerPrimary", { fg = palette.orange, bold = true, reverse = true })
   set_hl(0, "EyelinerSecondary", { fg = palette.blue, bold = true, reverse = true })
   set_hl(0, "Visual", { bg = palette.dark_blue })
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
            if vim.g.colors_name ~= "vague" then
               return
            end

            highlight_overrides()
         end
      })
   end
}
