--
-- default lsp server config
--
vim.lsp.config("*", {
   autostart = true,
   single_file_support = true,
   on_attach = function()
      vim.lsp.semantic_tokens.enable(false)
   end,
})

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
-- diagnostic config
--
vim.diagnostic.config({
   virtual_text = false,
   signs = {
      text = {
         [vim.diagnostic.severity.ERROR] = '󰅚 ',
         [vim.diagnostic.severity.WARN] = '󰀪 ',
         [vim.diagnostic.severity.INFO] = '󰋽 ',
         [vim.diagnostic.severity.HINT] = '󰌶 ',
      }
   },
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
