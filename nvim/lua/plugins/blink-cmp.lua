return {
   "saghen/blink.cmp",
   event = { "CmdlineEnter", "InsertEnter" },
   dependencies = {
      "rafamadriz/friendly-snippets",
      -- "hrsh7th/nvim-cmp",
   },
   version = "1.*",
   opts = {
      keymap = {
         preset = "enter",
         ["<S-Tab>"] = { "select_prev", "fallback" },
         ["<Tab>"] = { "select_next", "fallback" },
      },

      appearance = {
         nerd_font_variant = "normal"
      },

      completion = {
         menu = { border = "rounded" },
         documentation = {
            auto_show = true,
            window = { border = "rounded" }
         },
         list = {
            selection = { preselect = false, auto_insert = true },
         }
      },
      sources = {
         default = { "lsp", "path", "snippets", "buffer" },
         per_filetype = {
            sql = { 'snippets', 'dadbod', 'buffer' },
         },
         providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
         },
      },
      fuzzy = { implementation = "prefer_rust" },
      cmdline = {
         keymap = {
            preset = "inherit",
            ["<CR>"] = { "accept_and_enter", "fallback" }
         },
         completion = {
            menu = { auto_show = true },
            list = {
               selection = { preselect = false, auto_insert = true },
            }
         },
      }
   },
   opts_extend = { "sources.default" },
}
