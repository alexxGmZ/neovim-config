require("alex.plugins-setup")

require("alex.core.autocmds")
require("alex.core.colorscheme")
require("alex.core.keymaps")
require("alex.core.options")

-- plugins or extensions configs
require("alex.plugins.bufferline")
require("alex.plugins.catppuccin")
require("alex.plugins.colorizer")
require("alex.plugins.comment")
require("alex.plugins.indent-blankline")
require("alex.plugins.lualine")
require("alex.plugins.nvim-tree")
require("alex.plugins.tokyonight")
require("alex.plugins.treesitter")
require("alex.plugins.treesitter-context")
require("alex.plugins.vim-illuminate")

-- lsp stuff
require("alex.plugins.lsp.mason")
require("alex.plugins.lsp.lspconfig")
require("alex.plugins.lsp.nvim-cmp")

-- lazy loads
-- require("alex.plugins.codewindow")
-- require("alex.plugins.symbols-outline")
