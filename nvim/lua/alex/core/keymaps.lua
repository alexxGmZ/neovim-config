vim.g.mapleader = " "
local map = vim.keymap

-- terminal
map.set("t", "<Esc>", "<C-\\><C-n>")
map.set("n", "<leader>vst", function() vim.cmd("vsplit term://$SHELL") end, { desc = "Vertical Terminal Split" })
map.set("n", "<leader>spt", function() vim.cmd("split term://$SHELL") end, { desc = "Horizontal Terminal Split" })
map.set("n", "<leader>tnt", function() vim.cmd("tabnew term://$SHELL") end, { desc = "New Tab Terminal" })

-- motions
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("n", "<C-o>", "<C-o>zz")
map.set("n", "<C-i>", "<C-i>zz")

map.set("n", "<leader>ww", function() vim.cmd("w") end, { desc = "Write or Save file" })
map.set("n", "<leader>wq", function() vim.cmd("wq") end, { desc = "Write and Quit file" })
map.set("n", "<leader>wa", function() vim.cmd("wa") end, { desc = "Write all file" })
map.set("n", "<leader>qq", function() vim.cmd("q") end, { desc = "Quit file" })
map.set("n", "<leader>qa", function() vim.cmd("qa") end, { desc = "Quit all file" })

-- nohlsearch
map.set("n", "<Esc>", function() vim.cmd("noh") end, { desc = "nohlsearch" })

-- fzf
map.set("n", "<C-p>", function() vim.cmd("FzfLua files") end, { desc = "FzfLua: FzfLua files" })

-- split resizing
map.set("n", "<leader>-", "<C-w>3-", { desc = "Pane: Decrease current pane height" })
map.set("n", "<leader>=", "<C-w>3+", { desc = "Pane: Increate current pane height" })
map.set("n", "<leader>.", "<C-w>3>", { desc = "Pane: Increase current pane width" })
map.set("n", "<leader>,", "<C-w>3<", { desc = "Pane: Decrease current pane width" })
