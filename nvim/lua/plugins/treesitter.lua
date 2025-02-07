return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         local treesitter = require('nvim-treesitter.configs')
         treesitter.setup {
            -- parser_install_dir = "/home/alex/.local/share/nvim/lazy/nvim-treesitter",
            ensure_installed = {
               "html",
               "css",
               "javascript",
               "php",
               "python",
               "java",
               "cpp",
               "json",
               "sql"
            },
            sync_install = false,
            auto_install = true,
            ignore_install = {
               "bash",
               "c",
               "lua",
               "markdown",
               "markdown_inline",
               "python",
               "query",
               "vim",
               "vimdoc"
            },
            highlight = {
               enable = false,
               disable = { "html", "csv", "tmux" },
               additional_vim_regex_highlighting = false,
            },
            incremental_selection = { enable = false },
            indent = { enable = false }
         }
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      cmd = { "TSContextEnable", "TSContextToggle" },
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
