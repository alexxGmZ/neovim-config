return {
   {
      "lewis6991/gitsigns.nvim",
      event = "VeryLazy",
      config = function()
         require("gitsigns").setup {
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
               virt_text = true,
               virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
               delay = 500,
               ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>, <abbrev_sha> - \"<summary>\"",
         }
      end
   },
   {
      "idanarye/vim-merginal",
      cmd = { "Merginal", "MerginalToggle", "Git", "G" },
      dependencies = { "tpope/vim-fugitive" },
   },
   {
      "akinsho/git-conflict.nvim",
      cmd = "GitConflictListQf",
      version = "*",
      config = function()
         require("git-conflict").setup()
      end
   }
}

