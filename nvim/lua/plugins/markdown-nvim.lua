return {
   "MeanderingProgrammer/markdown.nvim",
   name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
   ft = "markdown",
   dependencies = { "nvim-treesitter/nvim-treesitter" },
   config = function()
      require("render-markdown").setup({
         heading = {
            icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
         },
      })
   end,
}
