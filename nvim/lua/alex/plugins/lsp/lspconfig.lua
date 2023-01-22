local navic_setup, navic = pcall(require, "nvim-navic")
local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not navic_setup or not cmp_nvim_lsp_setup or
	not lspconfig_setup or not mason_lspconfig_setup then
	return
end

-- table of installed lsps
-- add the lsp server name here after installing
local LSP_LIST = {
	"pyright",
	"jdtls",
	"html",
	"clangd",
	"sumneko_lua",
	"intelephense",
	"vimls",
	"cssls",
	"marksman",
	"texlab",
	"tailwindcss",
	"bashls",
}

local map = vim.keymap
local lsp = vim.lsp

local opts = {
	noremap = true,
	silent = true
}

map.set("n", "<leader>qls", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	map.set('n', 'gD', lsp.buf.declaration, bufopts)
	map.set('n', 'gd', lsp.buf.definition, bufopts)
	map.set('n', 'gr', lsp.buf.references, bufopts)
	map.set('n', 'gi', lsp.buf.implementation, bufopts)

	map.set('n', 'K', lsp.buf.hover, bufopts)
	map.set('n', '<C-k>', lsp.buf.signature_help, bufopts)

	map.set('n', '<space>D', lsp.buf.type_definition, bufopts)
	map.set('n', '<space>rn', lsp.buf.rename, bufopts)
	map.set('n', '<space>ca', lsp.buf.code_action, bufopts)
	map.set('n', '<space>f', function() lsp.buf.format { async = true } end, bufopts)

	-- add nvim-navic
	if client.server_capabilities.documentSymbolProvider then
		return navic.attach(client, bufnr)
	end
end

-- cmp-nvim-lsp plugin
local capabilities = cmp_nvim_lsp.default_capabilities()

-- loop all the avaibale lsp inside LSP_LIST
for _, lsp_server in pairs(LSP_LIST) do
	-- basic configuration for installed lsp servers
	lspconfig[lsp_server].setup{
		capabilities = capabilities,
		on_attach = on_attach,
	}

	-- custom lsp configuration below

	if lsp_server == "bashls" then
		lspconfig[lsp_server].setup{
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {'zsh', 'bash', 'sh'}
		}
	end
end
