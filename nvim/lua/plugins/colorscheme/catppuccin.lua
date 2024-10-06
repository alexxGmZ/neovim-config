return {
   "catppuccin/nvim",
   name = "catppuccin",
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
            miscs = {},
         }
      })
      vim.cmd.colorscheme "catppuccin"
   end
}
