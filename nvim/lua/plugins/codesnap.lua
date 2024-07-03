return {
   "mistricky/codesnap.nvim",
   build = "make",
   cmd = {
      "CodeSnap",
      "CodeSnapSave"
   },
   config = function()
      require("codesnap").setup({
         save_path = "~/Pictures/codesnap.png",
         code_font_family = "Fira Code",
         bg_theme = "bamboo",
         watermark = "Code ni Al"
      })
   end
}
