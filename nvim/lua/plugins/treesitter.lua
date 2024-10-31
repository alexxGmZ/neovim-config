return {
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
            enable = true,
            disable = { "html", "csv", "tmux" },
            additional_vim_regex_highlighting = false,
         },
         incremental_selection = { enable = false },
         indent = { enable = false }
      }
   end,
}
