return {
   "nvim-treesitter/nvim-treesitter-context",
   event = "VeryLazy",
   config = function()
      vim.cmd [[
			hi TreesitterContextBottom gui=underline
		]]
      require 'treesitter-context'.setup {
         enable = true,
         max_lines = 0,
         min_window_height = 0,
         line_numbers = true,
         multiline_threshold = 20,
         trim_scope = 'outer',
         mode = 'cursor',
         separator = nil,
         zindex = 20,
         on_attach = nil,
      }
   end,
   dependencies = { "nvim-treesitter/nvim-treesitter" },
}
