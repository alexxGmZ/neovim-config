local navic_setup, navic = pcall(require, "nvim-navic")
local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig_setup, lspconfig = pcall(require, "lspconfig")

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
lspconfig['pyright'].setup {
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- java
lspconfig['jdtls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- hmtl
lspconfig['html'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- c, c++
lspconfig['clangd'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- lua
lspconfig['sumneko_lua'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- php
lspconfig['intelephense'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach,
}

-- php
-- ['phpactor'].setup{
-- 	capabilities = capabilities,
-- }

-- vimscript
lspconfig['vimls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
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
	on_attach = navic_on_attach
}

-- markdown
lspconfig['marksman'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- latex
lspconfig['texlab'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

-- latex
lspconfig['tailwindcss'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

lspconfig['bashls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach,
	filetypes = {'zsh', 'bash', 'sh'}
}

