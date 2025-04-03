return {
   cmd = { "intelephense", "--stdio" },
   filetypes = { "php" },
   settings = {
      intelephense = {
         diagnostics = {
            undefinedMethods = false,
            undefinedFunctions = false,
         }
      }
   }
}
