return {
   "MeanderingProgrammer/markdown.nvim",
   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
   ft = "markdown",
   dependencies = { "nvim-treesitter/nvim-treesitter" },
   config = function()
      require("render-markdown").setup({
         heading = {
            icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
            signs = { "" },
            backgrounds = { 'DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText' },
            foregrounds = {
               "@markup.heading.1.markdown",
               "@markup.heading.2.markdown",
               "@markup.heading.3.markdown",
               "@markup.heading.4.markdown",
               "@markup.heading.5.markdown",
               "@markup.heading.6.markdown"
            }
         },
         code = { sign = false },
         checkbox = {
            unchecked = {
               highlight = "DiagnosticError"
            },
            checked = {
               highlight = "DiagnosticOk"
            }
         }
      })
   end,
}
