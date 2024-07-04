return {
   "NMAC427/guess-indent.nvim",
   cmd = "GuessIndent",
   config = function()
      require("guess-indent").setup {
         auto_cmd = false,
         filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
            "netrw",
            "tutor",
            "gitcommit",
            "oil",
            "fugitive",
            "git",
            "gitcommit"
         },
      }
   end,
}
