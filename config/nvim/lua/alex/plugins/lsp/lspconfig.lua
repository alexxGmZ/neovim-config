local navic_setup, navic = pcall(require, "nvim-navic")
local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_setup = pcall(require, "lspconfig")

if not navic_setup or
	not cmp_nvim_lsp_setup or
	not lspconfig_setup then
	return
end

-- nvim-navic plugin
local navic_on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		return navic.attach(client, bufnr)
	end
end

-- cmp-nvim-lsp plugin
local capabilities = cmp_nvim_lsp.default_capabilities()

-- python
require('lspconfig')['pyright'].setup {
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- java
require('lspconfig')['jdtls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- hmtl
require('lspconfig')['html'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- c, c++, objective c, c#
require('lspconfig')['clangd'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- lua
require('lspconfig')['sumneko_lua'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- php
require('lspconfig')['intelephense'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach,
}

-- php
-- require('lspconfig')['phpactor'].setup{
-- 	capabilities = capabilities,
-- }

-- vimscript
require('lspconfig')['vimls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- sql
-- require('lspconfig')['sqls'].setup{
-- 	capabilities = capabilities,
-- 	on_attach = navic_on_attach
-- }

-- R
-- require('lspconfig')['r_language_server'].setup{
-- 	capabilities = capabilities,
-- 	on_attach = navic_on_attach
-- }

-- css
require('lspconfig')['cssls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- markdown
require('lspconfig')['marksman'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- latex
require('lspconfig')['texlab'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- latex
require('lspconfig')['tailwindcss'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

