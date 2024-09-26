return {
   "ibhagwan/fzf-lua",
   cmd = "FzfLua",
   dependencies = {
      "junegunn/fzf",
   },
   keys = {
      { "<C-p>", "<cmd>FzfLua files<CR>", desc = "FzfLua: FzfLua files" },
      { "<leader>lg", "<cmd>FzfLua live_grep<CR>", desc = "FzfLua: FzfLua live grep" }
   },
   config = function()
      require("fzf-lua").setup {
         winopts = {},
         previewers = {
            builtin = {
               syntax = false,
               treesitter = { enable = false },
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
