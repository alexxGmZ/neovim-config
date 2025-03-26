local create_user_command = vim.api.nvim_create_user_command

create_user_command("DiffOrig", function()
   local scratch_buffer = vim.api.nvim_create_buf(false, true)
   local current_ft = vim.bo.filetype
   vim.cmd("vertical sbuffer" .. scratch_buffer)
   vim.bo[scratch_buffer].filetype = current_ft
   vim.cmd("read ++edit #") -- load contents of previous buffer into scratch_buffer
   vim.cmd.normal('1G"_d_') -- delete extra newline at top of scratch_buffer without overriding register
   vim.cmd.diffthis()       -- scratch_buffer
   vim.cmd.wincmd("p")
   vim.cmd.diffthis()       -- current buffer
end, {})

vim.opt.spell = false
vim.opt.spelllang = { 'en_us' }

-- enable spell
vim.api.nvim_create_user_command("Spell", function()
   vim.cmd("setlocal spell")
end, {})

-- disble spell
vim.api.nvim_create_user_command("NoSpell", function()
   vim.cmd("setlocal nospell")
end, {})

-- toggle spell
vim.api.nvim_create_user_command("SpellToggle", function()
   vim.cmd("setlocal invspell")
end, {})
