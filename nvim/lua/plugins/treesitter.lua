return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      branch = "main",
      config = function()
         local treesitter = require("nvim-treesitter")
         local installed_languages = treesitter.get_installed()

         treesitter.install {
            "html",
            "css",
            "javascript",
            "php",
            "python",
            "java",
            "cpp",
            "json",
            "sql"
         }

         vim.api.nvim_create_autocmd('FileType', {
            pattern = installed_languages,
            callback = function()
               vim.treesitter.start()
               vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
               vim.wo.foldmethod = 'expr'
               vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
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
