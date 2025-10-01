return {
   cmd = { "intelephense", "--stdio" },
   filetypes = { "php" },
   root_markers = { '.git', 'composer.json' },
   settings = {
      intelephense = {
         diagnostics = {
            undefinedMethods = false,
            undefinedFunctions = false,
         }
      }
   }
}
