return {
   "ibhagwan/fzf-lua",
   cmd = "FzfLua",
   dependencies = {
      "junegunn/fzf",
   },
   keys = {
      { "<C-p>",      "<cmd>FzfLua files<CR>",     desc = "FzfLua: FzfLua files" },
      { "<leader>lg", "<cmd>FzfLua live_grep<CR>", desc = "FzfLua: FzfLua live grep" },
      { "<leader>bf", "<cmd>FzfLua buffers<CR>", desc = "FzfLua: FzfLua buffers" }
   },
   config = function()
      local actions = require("fzf-lua.actions")
      require("fzf-lua").setup {
         winopts = {},
         previewers = {
            builtin = {
               syntax = false,
               treesitter = { enable = false },
               extensions = {
                  ["svg"] = { "viu", "-b" },
                  ["png"] = { "viu", "-b" },
                  ["jpg"] = { "viu", "-b" },
               }
            }
         },
         keymap = {
            fzf = {
               true,
               ["ctrl-a"] = "toggle-all",
            }
         },
         actions = {
            files = {
               true,
               ["ctrl-q"] = actions.file_sel_to_qf,
            }
         }
      }
   end
}
