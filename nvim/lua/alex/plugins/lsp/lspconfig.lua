local navic_setup, navic = pcall(require, "nvim-navic")
local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not navic_setup or
	not cmp_nvim_lsp_setup or
	not lspconfig_setup or
	not mason_lspconfig_setup then
	return
end

local map = vim.keymap
local opts = {
	noremap = true,
	silent = true
}

map.set("n", "<leader>qls", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

	-- add nvim-navic
	if client.server_capabilities.documentSymbolProvider then
		return navic.attach(client, bufnr)
	end
end

-- cmp-nvim-lsp plugin
local capabilities = cmp_nvim_lsp.default_capabilities()

-- python
lspconfig['pyright'].setup {
	capabilities = capabilities,
	on_attach = on_attach
}

-- java
lspconfig['jdtls'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- hmtl
lspconfig['html'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- c, c++, objective c, c#
lspconfig['clangd'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- lua
lspconfig['sumneko_lua'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- php
lspconfig['intelephense'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- php
-- ['phpactor'].setup{
-- 	capabilities = capabilities,
-- }

-- vimscript
lspconfig['vimls'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- sql
-- lspconfig['sqls'].setup{
-- 	capabilities = capabilities,
-- 	on_attach = navic_on_attach
-- }

-- R
-- lspconfig['r_language_server'].setup{
-- 	capabilities = capabilities,
-- 	on_attach = navic_on_attach
-- }

-- css
lspconfig['cssls'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- markdown
lspconfig['marksman'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- latex
lspconfig['texlab'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- latex
lspconfig['tailwindcss'].setup{
	capabilities = capabilities,
	on_attach = on_attach
}

lspconfig['bashls'].setup{
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {'zsh', 'bash', 'sh'}
}

