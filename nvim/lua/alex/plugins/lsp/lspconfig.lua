local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

--
-- table of installed lsps
-- add the lsp server name here after installing
--
local LSP_LIST = {
	"pyright",
	"jdtls",
	"html",
	"clangd",
	"lua_ls",
	"intelephense",
	"vimls",
	"cssls",
	"marksman",
	"texlab",
	-- "tailwindcss",
	"bashls",
	"lemminx",
	"quick_lint_js",
	"tsserver",
	"jsonls",
	-- "sqlls"
}

--
-- mason setup
--
mason_lspconfig.setup{
	ensure_installed = LSP_LIST
}

--
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
--
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<leader>f', function()
		-- 	vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

--
-- cmp-nvim-lsp plugin
--
local capabilities = cmp_nvim_lsp.default_capabilities()

--
-- lsp configurations
--
for _, lsp_server in pairs(LSP_LIST) do
	-- basic configuration for installed lsp servers
	lspconfig[lsp_server].setup{
		autostart = true,
		capabilities = capabilities,
		-- on_attach = on_attach,
		-- on_attach = require("virtualtypes").on_attach
	}

	-- custom lsp configuration below

	if lsp_server == "bashls" then
		lspconfig[lsp_server].setup{
			capabilities = capabilities,
			-- on_attach = on_attach,
			-- on_attach = require("virtualtypes").on_attach,
			filetypes = {'zsh', 'bash', 'sh'}
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
	{"╭", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╮", "FloatBorder"},
	{"│", "FloatBorder"},
	{"╯", "FloatBorder"},
	{"─", "FloatBorder"},
	{"╰", "FloatBorder"},
	{"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

