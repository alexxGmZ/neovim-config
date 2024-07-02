vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("alex.core.autocmds")
require("alex.core.keymaps")
require("alex.core.options")
require("alex.core.usercmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
   require("plugins"),

   {
      ui = { border = "rounded" },
   }
)

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
