return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      branch = "main",
      config = function()
         local treesitter = require("nvim-treesitter")

         vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function(ev)
               local available_languages = treesitter.get_available()
               local installed_languages = treesitter.get_installed()
               local buffer_filetype = vim.bo.filetype
               local ignored_filetypes = {
                  "csv"
               }

               if vim.tbl_contains(available_languages, buffer_filetype)
                   and not vim.tbl_contains(ignored_filetypes, buffer_filetype) then
                  treesitter.install(buffer_filetype)
               end

               if vim.tbl_contains(installed_languages, buffer_filetype)
                   and not vim.tbl_contains(ignored_filetypes, buffer_filetype) then
                  vim.treesitter.start(ev.buf, buffer_filetype)
               end
            end
         })
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      cmd = { "TSContext" },
      opts = {
         enable = true,
         max_lines = 0,
         min_window_height = 0,
         line_numbers = true,
         multiline_threshold = 20,
         trim_scope = "outer",
         mode = "cursor",
         separator = nil,
         zindex = 50,
         on_attach = nil,
      },
   },
   {
      "Wansmer/treesj",
      keys = {
         { "<leader>m", "<cmd>TSJToggle<cr>", desc = "TreeSJ: Toggle" }
      },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("treesj").setup({
            use_default_keymaps = true,
            max_join_length = 200,
         })
      end
   },
}
