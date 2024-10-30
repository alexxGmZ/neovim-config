-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

return {
   "3rd/image.nvim",
   dependencies = { "leafo/magick" },
   config = function()
      require("image").setup({
         integrations = {
            markdown = { enabled = false },
            neorg = { enabled = false },
         },
         tmux_show_only_in_active_window = true
      })
   end
}
