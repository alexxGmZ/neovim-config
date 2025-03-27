return {
   cmd = { "lua-language-server" },
   filetypes = { "lua" },
   autostart = true,
   single_file_support = true,
   settings = {
      Lua = {
         diagnostics = { globals = { "vim" } }
      }
   }
}
