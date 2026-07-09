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

create_autocmd("BufWritePost", {
   pattern = "*.typ",
   group = user_augroup,
   callback = function(args)
      local file = vim.api.nvim_buf_get_name(0)
      local filename = vim.fn.fnamemodify(args.file, ":t")
      local exclude_files = {
         "conf.typ"
      }

      local notify = function(message, log_level)
         vim.notify(message, log_level, { title = "Typst" })
      end

      if vim.fn.executable('typst') == 0 then
         notify("󰅚 typst executable not found", "ERROR")
         return
      end

      if vim.tbl_contains(exclude_files, filename) then
         notify("󰀪 File (" .. filename .. ") excluded", "WARN")
         return
      end

      vim.fn.jobstart({ "typst", "compile", file }, {
         detach = true,
         stderr_buffered = true,
         on_stderr = function(_, data)
            local err_msg = table.concat(data, "\n")
            if err_msg ~= "" then
               notify(err_msg, "ERROR")
            end
         end,
         on_exit = function(_, code)
            if code == 0 then
               notify(" Compiled succesfully.")
            end
         end
      })
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
-- create_autocmd({"CmdlineEnter"}, {
--    pattern = "*",
--    group = user_augroup,
--    callback = function()
--       vim.opt.cmdheight = 1
--    end
-- })

-- hide cmdline
-- create_autocmd({ "CmdlineLeave", "UIEnter" }, {
--    pattern = "*",
--    group = user_augroup,
--    callback = function()
--       vim.opt.cmdheight = 0
--    end
-- })

-- "syntax on" to some filetypes. "syntax" is off by default in order to utilize treesitter
-- create_autocmd("FileType", {
--    pattern = { "html", "tmux", "fugitive", "sh", "zsh", "oil", "git", "man" },
--    group = user_augroup,
--    command = "syntax on"
-- })
