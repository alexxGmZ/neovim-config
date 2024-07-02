return {
   "NMAC427/guess-indent.nvim",
   config = function()
      require("guess-indent").setup {
         auto_cmd = true,
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
