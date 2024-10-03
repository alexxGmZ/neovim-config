return {
   "hat0uma/csvview.nvim",
   cmd = { "CsvViewEnable", "CsvViewToggle" },
   config = function()
      require("csvview").setup()
   end
}
