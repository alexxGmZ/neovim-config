return {
   "ibhagwan/fzf-lua",
   cmd = "FzfLua",
   dependencies = {
      "junegunn/fzf",
   },
   keys = {
      { "<C-p>", "<cmd>FzfLua files<CR>", desc = "FzfLua: FzfLua files" }
   },
   config = function()
      require("fzf-lua").setup {
         winopts = {},
         previewers = {
            builtin = {
               syntax = true,
               treesitter = { enable = true },
               extensions = {
                  ["svg"] = "chafa",
                  ["png"] = "chafa",
                  ["jpg"] = "chafa",
               }
            }
         }
      }
   end
}
