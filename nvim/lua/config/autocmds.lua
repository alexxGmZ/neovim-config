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

-- enforce custom highlights every time the colorscheme changes
vim.opt.colorcolumn = "80,90"
create_autocmd("ColorScheme", {
   pattern = "*",
   group = user_augroup,
   callback = function()
      vim.cmd [[hi MatchParen gui=underline guifg=Orange guibg=#4e4e4e]]
   end
})

-- "syntax on" to some filetypes. "syntax" is off by default in order to utilize treesitter
create_autocmd("FileType", {
   pattern = { "html", "tmux", "fugitive", "sh", "zsh", "oil" },
   group = user_augroup,
   command = "syntax on"
})

-- create_autocmd("BufWritePost", {
--    pattern = { "*.md" },
--    callback = function()
--       local md_file = vim.api.nvim_buf_get_name(0)
--       local pdf_file = string.gsub(md_file, ".md", ".pdf")
--       local pandoc_var = "geometry:margin=1in"
--       local command = { "pandoc", md_file, "-o", pdf_file, "-V", pandoc_var }
--
--       vim.notify(md_file)
--       vim.notify(pdf_file)
--       vim.notify(pandoc_var)
--
--       vim.system(command, { text = true }, function(obj)
--          if obj.stderr ~= "" then
--             vim.notify(obj.stderr, "WARN")
--          end
--       end)
--    end
-- })
