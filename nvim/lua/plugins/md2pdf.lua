return {
   "alexxGmZ/Md2Pdf",
   cmd = "Md2Pdf",
   -- dir = "$HOME/Git/Md2Pdf",
   config = function()
      require("Md2Pdf").setup({
         pdf_engine = "xelatex",
         yaml_template_path = "/home/al/Documents/pandoc_template.yml"
      })
   end
}
