return {
   "hrsh7th/nvim-cmp",
   event = { "CmdlineEnter", "InsertEnter" },
   dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind.nvim",
      "rafamadriz/friendly-snippets"
   },
   config = function()
      vim.cmd("let g:vsnip_filetypes = {}")

      local cmp_setup, cmp = pcall(require, "cmp")
      local lspkind = require("lspkind")

      if not cmp_setup then
         return
      end

      cmp.setup({
         formatting = {
            format = lspkind.cmp_format({
               mode = "symbol_text",
               maxwidth = 50,
               ellipsis_char = "...",
               before = function(entry, vim_item)
                  return vim_item
               end
            })
         },

         experimental = {
            ghost_text = false
         },

         snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
               vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
         },

         window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
         },

         mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item()
               else
                  fallback()
               end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item()
               else
                  fallback()
               end
            end, { "i", "s" }),
         }),

         sources = cmp.config.sources({
            {
               name = "nvim_lsp",
               max_item_count = 10
            },
            { name = "vsnip" }, -- For vsnip users.
            { name = "buffer" },
            {
               name = "path",
               max_item_count = 10
            },
            { name = "nvim_lsp_signature_help" },
            {
               name = "spell",
               option = {
                  keep_all_entries = false,
                  enable_in_context = function()
                     return true
                  end
               },
               max_item_count = 10
            }
         }),

         sorting = {
            comparators = {
               cmp.config.compare.offset,
               cmp.config.compare.score,
               cmp.config.compare.exact,
               require "cmp-under-comparator".under,
               cmp.config.compare.kind,
               cmp.config.compare.sort_text,
               cmp.config.compare.length,
               cmp.config.compare.order,
            },
         },

         performance = {
            -- max_view_entries = 20
            trigger_debounce_time = 500,
            throttle = 550,
            fetching_timeout = 80,
         },

         -- completion = {
         -- 	keyword_length = 2
         -- }
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
         sources = cmp.config.sources({
            { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
         }, {
            { name = "buffer" },
         })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = "buffer" }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            {
               name = "path",
               max_item_count = 20
            },
            {
               name = "cmdline",
               max_item_count = 20
            }
         }),
         completion = {
            keyword_length = 2
         }
      })

      cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
         sources = cmp.config.sources({
            {
               name = "vim-dadbod-completion",
               max_item_count = 10
            }
         })
      })
   end
}
