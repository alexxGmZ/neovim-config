return {
   "RRethy/vim-illuminate",
   event = "VeryLazy",
   config = function()
      require("illuminate").configure({
         providers = { 'lsp', 'treesitter', 'regex' },
         modes_allowlist = { "n" },
         filetypes_denylist = {
            "help",
            "text",
            "man",
            "checkhealth",
            "NvimTree",
            "Outline"
         },
         min_count_to_highlight = 2,
      })
   end
}
