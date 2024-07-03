return {
   'kristijanhusak/vim-dadbod-ui',
   dependencies = {
      {
         'tpope/vim-dadbod',
         ft = { 'sql', 'mysql', 'plsql' },
         lazy = true
      },
      {
         'kristijanhusak/vim-dadbod-completion',
         ft = { 'sql', 'mysql', 'plsql' },
         lazy = true
      },
   },
   cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
   },
   init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 30
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_disable_mappings = 1
      vim.g.db_ui_show_help = 0
   end,
   config = function()
      vim.api.nvim_create_user_command("DBUISaveQuery", function()
         vim.cmd [[execute "normal \<Plug>(DBUI_SaveQuery)"]]
      end, {})

      vim.api.nvim_create_autocmd("FileType", {
         pattern = { "dbui" },
         group = "HANDSOME",
         callback = function(ev)
            local map = vim.keymap
            map.set("n", "<CR>", "<Plug>(DBUI_SelectLine)", { desc = "DBUI: Select Line", buffer = ev.buf })
            map.set("n", "K", "<Plug>(DBUI_ToggleDetails)", { desc = "DBUI: Toggle Details", buffer = ev.buf })
            map.set("n", "R", "<Plug>(DBUI_Redraw)", { desc = "DBUI: Refresh", buffer = ev.buf })
            map.set("n", "D", "<Plug>(DBUI_DeleteLine)", { desc = "DBUI: Delete Line", buffer = ev.buf })
            map.set("n", "r", "<Plug>(DBUI_RenameLine)", { desc = "DBUI: Rename Line", buffer = ev.buf })
            map.set("n", "q", "<Plug>(DBUI_Quit)", { desc = "DBUI: Quit", buffer = ev.buf })
            map.set("n", "W", "<Plug>(DBUI_SaveQuery)", { desc = "DBUI: Save Query", buffer = ev.buf })
         end
      })
   end

}
