return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      branch = "main",
      config = function()
         local ts = require('nvim-treesitter')

         -- State tracking for async parser loading
         local parsers_loaded = {}
         local parsers_pending = {}
         local parsers_failed = {}

         local ns = vim.api.nvim_create_namespace('treesitter.async')

         -- Helper to start highlighting and indentation
         local function start(buf, lang)
            local ok = pcall(vim.treesitter.start, buf, lang)
            if ok then
               vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
            return ok
         end

         -- Install core parsers after lazy.nvim finishes loading all plugins
         vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyDone',
            once = true,
            callback = function()
               ts.install({
                  "html",
                  "css",
                  "javascript",
                  "php",
                  "python",
                  "java",
                  "cpp",
                  "json",
                  "sql"
               }, {
                  max_jobs = 8,
               })
            end,
         })

         -- Decoration provider for async parser loading
         vim.api.nvim_set_decoration_provider(ns, {
            on_start = vim.schedule_wrap(function()
               if #parsers_pending == 0 then
                  return false
               end
               for _, data in ipairs(parsers_pending) do
                  if vim.api.nvim_buf_is_valid(data.buf) then
                     if start(data.buf, data.lang) then
                        parsers_loaded[data.lang] = true
                     else
                        parsers_failed[data.lang] = true
                     end
                  end
               end
               parsers_pending = {}
            end),
         })

         local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

         local ignore_filetypes = {
            'checkhealth',
            'lazy',
            'mason',
            'snacks_dashboard',
            'snacks_notif',
            'snacks_win',
            'dashboard',
            'oil',
            'fzf',
            'Outline',
            'NvimTree',
            'blink-cmp-menu',
            'fugitive'
         }

         -- Auto-install parsers and enable highlighting on FileType
         vim.api.nvim_create_autocmd('FileType', {
            group = group,
            desc = 'Enable treesitter highlighting and indentation (non-blocking)',
            callback = function(event)
               if vim.tbl_contains(ignore_filetypes, event.match) then
                  return
               end

               local lang = vim.treesitter.language.get_lang(event.match) or event.match
               local buf = event.buf

               if parsers_failed[lang] then
                  return
               end

               if parsers_loaded[lang] then
                  -- Parser already loaded, start immediately (fast path)
                  start(buf, lang)
               else
                  -- Queue for async loading
                  table.insert(parsers_pending, { buf = buf, lang = lang })
               end

               -- Auto-install missing parsers (async, no-op if already installed)
               ts.install({ lang })
            end,
         })
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-context",
      cmd = { "TSContext" },
      opts = {
         enable = true,
         max_lines = 0,
         min_window_height = 0,
         line_numbers = true,
         multiline_threshold = 20,
         trim_scope = "outer",
         mode = "cursor",
         separator = nil,
         zindex = 50,
         on_attach = nil,
      },
   },
   {
      "Wansmer/treesj",
      keys = {
         { "<leader>m", "<cmd>TSJToggle<cr>", desc = "TreeSJ: Toggle" }
      },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("treesj").setup({
            use_default_keymaps = true,
            max_join_length = 200,
         })
      end
   },
}
