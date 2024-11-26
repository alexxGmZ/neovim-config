return {
   "vague2k/vague.nvim",
   priority = 1000,
   -- lazy = true,
   config = function ()
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
   end
}
