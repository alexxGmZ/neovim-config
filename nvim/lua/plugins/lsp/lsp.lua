--
-- table of installed lsps
-- add the lsp server name here after installing
--
local LSP_LIST = {
   -- "pyright",
   -- "jdtls",
   "html",
   -- "clangd",
   "lua_ls",
   "intelephense",
   -- "vimls",
   "cssls",
   "marksman",
   -- "texlab",
   -- "tailwindcss",
   "bashls",
   -- "lemminx",
   -- "quick_lint_js",
   "ts_ls",
   "jsonls",
   "gopls",
   "tinymist"
}

local FORMATTER_LIST = {
   blade = { "blade-formatter" },
   typst = { "typstyle" }
}

return {
   {
      "mason-org/mason.nvim",
      cmd = { "Mason" },
      config = function()
         require("mason").setup({
            ui = {
               icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
               },
               border = "rounded",
            }
         })
      end

   },
   {
      "mason-org/mason-lspconfig.nvim",
      cmd = { "LspInstall", "LspUninstall" },
      dependencies = {
         "mason-org/mason.nvim",
         "neovim/nvim-lspconfig",
      },
      config = function()
         require("mason-lspconfig").setup {
            ensure_installed = LSP_LIST,
            automatic_enable = false
         }
      end
   },
   {
      "stevearc/conform.nvim",
      keys = {
         {
            "<leader>f",
            function()
               require("conform").format({
                  async = true,
                  lsp_format = "fallback"
               })
            end,
         }
      },
      config = function()
         require("conform").setup({
            formatters_by_ft = FORMATTER_LIST
         })
      end
   }
}
