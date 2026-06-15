vim.g.mapleader = " "
local map = vim.keymap

-- terminal
map.set("t", "<Esc>", "<C-\\><C-n>")
map.set("n", "<leader>vst", "<cmd>vsplit term://$SHELL<CR>", { desc = "Vertical Terminal Split" })
map.set("n", "<leader>spt", "<cmd>split term://$SHELL<CR>", { desc = "Horizontal Terminal Split" })
map.set("n", "<leader>tnt", "<cmd>tabnew term://$SHELL<CR>", { desc = "New Tab Terminal" })

-- motions
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("n", "<C-o>", "<C-o>zz")
map.set("n", "<C-i>", "<C-i>zz")

map.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Write or Save file" })
map.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Write and Quit file" })
map.set("n", "<leader>wa", "<cmd>wa<CR>", { desc = "Write all file" })
map.set("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit file" })
map.set("n", "<leader>qa", "<cmd>qa<CR>", { desc = "Quit all file" })

-- nohlsearch
map.set("n", "<Esc>", function() vim.cmd("noh") end, { desc = "nohlsearch" })

-- split resizing
map.set("n", "<leader>-", "<C-w>3-", { desc = "Pane: Decrease current pane height" })
map.set("n", "<leader>=", "<C-w>3+", { desc = "Pane: Increate current pane height" })
map.set("n", "<leader>.", "<C-w>3>", { desc = "Pane: Increase current pane width" })
map.set("n", "<leader>,", "<C-w>3<", { desc = "Pane: Decrease current pane width" })

local function define_word()
   local word = vim.fn.expand("<cword>")
   local buffer = vim.api.nvim_create_buf(false, true)
   local window_height = 25
   local lines = nil
   local buffer_line_count = 0

   if vim.fn.executable('dict') == 0 then
      vim.notify("dict executable not found", "ERROR")
      return
   end

   local command = vim.system({ "dict", word }, { text = true }):wait()

   if command.code ~= 0 then
      lines = vim.split(command.stderr, "\n", { plain = true })
   else
      lines = vim.split(command.stdout, "\n", { plain = true })
   end

   vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
   buffer_line_count = vim.api.nvim_buf_line_count(buffer)
   vim.bo[buffer].modifiable = false
   vim.bo[buffer].readonly = true

   if buffer_line_count < window_height then
      window_height = buffer_line_count
   end

   local window = vim.api.nvim_open_win(buffer, true, {
      relative = "cursor",
      bufpos = { 0, 0 },
      border = "single",
      width = 85,
      height = window_height,
      style = "minimal",
      title = word
   })

   vim.api.nvim_create_autocmd("WinLeave", {
      buf = buffer,
      once = true,
      callback = function()
         vim.api.nvim_win_close(window, true)
         vim.bo[buffer].bufhidden = "wipe"
      end
   })

   print("Dictionary", word)
end

map.set("n", "<leader>dc", define_word, { desc = "Dictionary" })
