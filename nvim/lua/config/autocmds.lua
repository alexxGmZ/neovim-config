local user_augroup = vim.api.nvim_create_augroup("HANDSOME", {})
local create_autocmd = vim.api.nvim_create_autocmd

-- trim trailing whitespaces
create_autocmd("BufWritePre", {
   pattern = "*",
   group = user_augroup,
   callback = function()
      local curr_pos = vim.fn.winsaveview()
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.winrestview(curr_pos)
   end
})

-- hide linenumber in terminal buffertype
create_autocmd("TermOpen", {
   pattern = "*",
   group = user_augroup,
   callback = function()
      vim.cmd([[setlocal nonumber norelativenumber]])
   end
})

-- show cmdline
create_autocmd("CmdlineEnter", {
   pattern = "*",
   group = user_augroup,
   callback = function()
      vim.opt.cmdheight = 1
   end
})

-- hide cmdline
create_autocmd({ "CmdlineLeave", "UIEnter" }, {
   pattern = "*",
   group = user_augroup,
   callback = function()
      vim.opt.cmdheight = 0
   end
})

-- "syntax on" to some filetypes. "syntax" is off by default in order to utilize treesitter
-- create_autocmd("FileType", {
--    pattern = { "html", "tmux", "fugitive", "sh", "zsh", "oil", "git", "man" },
--    group = user_augroup,
--    command = "syntax on"
-- })

create_autocmd("FileType", {
   pattern = { "markdown", "text", "man", "git", "fugitive", "gitcommit", "oil" },
   group = user_augroup,
   command = "setlocal norelativenumber | setlocal nonumber"
})
