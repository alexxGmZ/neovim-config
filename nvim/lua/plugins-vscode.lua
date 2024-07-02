return {
   require("alex.plugins.comment"),

   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({})
      end
   },
   require("alex.plugins.autoclose"),
}
