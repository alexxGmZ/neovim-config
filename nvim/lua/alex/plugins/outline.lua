return {
   "hedyhli/outline.nvim",
   cmd = { "Outline", "OutlineOpen" },
   dependencies = {
      "neovim/nvim-lspconfig",
   },
   keys = {
      { "<leader>tt", "<cmd>Outline<CR>", desc = "Outline: Toggle LSP code symbols outline" }
   },
   config = function()
      require("outline").setup {
         outline_window = {
            position = 'right',
            split_command = nil,
            width = 30,
            relative_width = false,
            auto_close = false,
            auto_goto = false,
            show_numbers = false,
            show_relative_numbers = false,
            show_cursorline = true,
            hide_cursor = false,
            wrap = false,
            focus_on_open = false,
            winhl = "OutlineDetails:Comment,OutlineLineno:LineNr",
         },

         outline_items = {
            highlight_hovered_item = false,
            show_symbol_details = true,
            show_symbol_lineno = true,
            auto_set_cursor = false,
            auto_update_events = {
               follow = { 'CursorHold' },
               items = {
                  'InsertLeave',
                  'WinEnter',
                  'BufEnter',
                  'BufWinEnter',
                  'TabEnter',
                  'BufWritePost',
               },
            },
         },

         -- Options for outline guides.
         -- Only in this fork
         guides = {
            enabled = true,
            markers = {
               bottom = '└',
               middle = '├',
               vertical = '│',
               horizontal = '─',
            },
         },

         symbol_folding = {
            autofold_depth = 1,
            auto_unfold_hover = true,
            markers = { '', '' },
         },

         preview_window = {
            auto_preview = false,
            open_hover_on_preview = true,
            width = 50,
            min_width = 50,
            relative_width = true,
            border = 'single',
            winhl = '',
            winblend = 0
         },

         providers = {
            lsp = { blacklist_clients = { "html" } },
         },
      }
   end
}
