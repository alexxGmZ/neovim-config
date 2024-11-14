return {
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
}
