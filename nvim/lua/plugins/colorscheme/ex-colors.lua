return {
   "aileot/ex-colors.nvim",
   lazy = true,
   cmd = "ExColors",
   opts = {
      colors_dir = vim.fn.stdpath("config") .. "/colors"
   }
}
