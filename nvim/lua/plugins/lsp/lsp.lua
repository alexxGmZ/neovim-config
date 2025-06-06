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
      "neovim/nvim-lspconfig",
      cmd = { "LspStart", "LspInfo", "Trouble" },
      dependencies = { "saghen/blink.cmp" },
      config = function()
         -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
         local lspconfig = require("lspconfig")

         --
         -- Use LspAttach autocommand to only map the following keys
         -- after the language server attaches to the current buffer
         --
         vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
               -- Enable completion triggered by <c-x><c-o>
               vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

               -- Buffer local mappings.
               -- See `:help vim.lsp.*` for documentation on any of the below functions
               local opts = { buffer = ev.buf }
               vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
               vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
               vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
               vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
               vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
               vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
               vim.keymap.set("n", "<leader>wl", function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
               end, opts)
               vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
               vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
               vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
               vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
               -- vim.keymap.set("n", "<leader>f", function()
               --    vim.lsp.buf.format { async = true }
               -- end, opts)
            end,
         })

         --
         -- blink-cmp capabilities
         --
         local capabilities = require('blink.cmp').get_lsp_capabilities()

         --
         -- lsp configurations
         --
         for _, lsp_server in pairs(LSP_LIST) do
            -- basic configuration for installed lsp servers
            lspconfig[lsp_server].setup {
               autostart = false,
               capabilities = capabilities,
               single_file_support = true,
               on_attach = function(client)
                  client.server_capabilities.semanticTokensProvider = nil
               end
            }

            -- custom lsp configuration below

            if lsp_server == "bashls" then
               lspconfig[lsp_server].setup {
                  autostart = false,
                  capabilities = capabilities,
                  single_file_support = true,
                  on_attach = function(client)
                     client.server_capabilities.semanticTokensProvider = nil
                  end,
                  filetypes = { "zsh", "bash", "sh" },
               }
            end

            if lsp_server == "intelephense" then
               lspconfig[lsp_server].setup {
                  autostart = false,
                  capabilities = capabilities,
                  single_file_support = true,
                  on_attach = function(client)
                     client.server_capabilities.semanticTokensProvider = nil
                  end,
                  settings = {
                     intelephense = {
                        diagnostics = { undefinedMethods = false }
                     }
                  }
               }
            end
         end

         --
         -- diagnostic symbols
         --
         local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }

         for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
         end

         --
         -- diagnostic config
         --
         vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
         })

         --
         -- borders
         --
         local border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
         }

         local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
         function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or border
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
         end
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
