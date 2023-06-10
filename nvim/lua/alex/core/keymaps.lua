vim.g.mapleader = " "
local map = vim.keymap

-- terminal
map.set("t", "<Esc>", "<C-\\><C-n>")
map.set("n", "<leader>vst", ":vsplit term://$SHELL<CR>")
map.set("n", "<leader>spt", ":split term://$SHELL<CR>")
map.set("n", "<leader>tnt", ":tabnew term://$SHELL<CR>")

-- motions
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("n", "<C-o>", "<C-o>zz")
map.set("n", "<C-i>", "<C-i>zz")

-- nvim-tree
map.set("n", "<leader>F", ":NvimTreeToggle<CR>")
map.set("n", "<leader><leader>f", ":NvimTreeToggle<CR>")
map.set("n", "<F6>", ":NvimTreeToggle<CR>")

-- write and quit
map.set("n", "<leader>ww", ":w<CR>")
map.set("n", "<leader>wq", ":wq<CR>")
map.set("n", "<leader>wa", ":wa<CR>")
map.set("n", "<leader>qq", ":q<CR>")
map.set("n", "<leader>qa", ":qa<CR>")

-- nohilight
map.set("n", "<Esc>", ":noh<CR>")

-- fzf
map.set("n", "<C-p>", ":FzfLua files<CR>")

-- Symbols Outline
map.set("n", "<F8>", ":SymbolsOutline<CR>")
map.set("n", "<leader>tt", ":SymbolsOutline<CR>")

-- autoclose brackets
-- map.set("i", "{", "{}<Esc>ha")
-- map.set("i", "[", "[]<Esc>ha")
-- map.set("i", "(", "()<Esc>ha")
-- map.set("i", "\"", "\"\"<Esc>ha")
-- map.set("i", "\'", "\'\'<Esc>ha")

-- split resizing
map.set("n", "<leader>-", "<C-w>3-")
map.set("n", "<leader>=", "<C-w>3+")
map.set("n", "<leader>.", "<C-w>3>")
map.set("n", "<leader>,", "<C-w>3<")

-- codewindow (custom command)
map.set("n", "<leader>mm", ":CWToggle<CR>")

-- jaq
map.set("n", "<leader>rr", ":Jaq<CR>")
