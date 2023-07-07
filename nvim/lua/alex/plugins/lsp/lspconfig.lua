local navic = require('nvim-navic')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- table of installed lsps
-- add the lsp server name here after installing
local LSP_LIST = {
	"pyright",
	-- "pylsp",
	"jdtls",
	"html",
	"clangd",
	"lua_ls",
	"intelephense",
	"vimls",
	"cssls",
	"marksman",
	"texlab",
	"tailwindcss",
	"bashls",
	"lemminx",
	"quick_lint_js",
	"tsserver"
}

navic.setup{
	lsp = {
		auto_attach = true
	}
}

mason_lspconfig.setup{
	ensure_installed = LSP_LIST
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
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
		vim.keymap.set('n', '<leader>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- cmp-nvim-lsp plugin
local capabilities = cmp_nvim_lsp.default_capabilities()

-- loop all the avaibale lsp inside LSP_LIST
for _, lsp_server in pairs(LSP_LIST) do
	-- basic configuration for installed lsp servers
	lspconfig[lsp_server].setup{
		capabilities = capabilities,
		-- on_attach = on_attach,
	}

	-- custom lsp configuration below

	if lsp_server == "bashls" then
		lspconfig[lsp_server].setup{
			capabilities = capabilities,
			-- on_attach = on_attach,
			filetypes = {'zsh', 'bash', 'sh'}
		}
	end
end

