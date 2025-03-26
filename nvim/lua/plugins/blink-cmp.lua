return {
   'saghen/blink.cmp',
   dependencies = {
      'rafamadriz/friendly-snippets',
      'hrsh7th/nvim-cmp',
   },
   version = '1.*',
   opts = {
      keymap = {
         preset = 'enter',
         ['<S-Tab>'] = { 'select_prev', 'fallback' },
         ['<Tab>'] = { 'select_next', 'fallback' },
      },

      appearance = {
         nerd_font_variant = 'normal'
      },

      completion = {
         menu = { border = 'rounded' },
         documentation = {
            auto_show = true,
            window = { border = 'rounded' }
         },
         list = {
            selection = { preselect = false, auto_insert = false },
         }
      },
      sources = {
         default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      cmdline = {
         completion = {
            menu = { auto_show = true },
            list = {
               selection = { preselect = false, auto_insert = false },
            }
         },
      }
   },
   opts_extend = { "sources.default" },
}
