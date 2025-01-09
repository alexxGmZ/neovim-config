require("config.autocmds")
require("config.keymaps")
require("config.options")
require("config.usercmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out,                            "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   spec = {
      { import = "plugins" },
      { import = "plugins.colorscheme" },
      { import = "plugins.lsp" },
      { import = "plugins.ui" },
   },
   ui = { border = "rounded" },
   change_detection = { enabled = false }
})

if vim.g.neovide then
   vim.g.neovide_transparency = 1
   vim.g.neovide_cursor_animation_length = 0.05
   vim.g.neovide_cursor_trail_size = 0.4
   vim.g.neovide_cursor_antialiasing = false
   vim.g.neovide_cursor_animate_in_insert_mode = false
   vim.g.neovide_cursor_smooth_blink = false
end

if vim.g.vscode then
   require("plugins-vscode")
end
