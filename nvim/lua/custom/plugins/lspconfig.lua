local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

--  capabilities.textdocument.foldingrange = {
--  	dynamicregistration = false,
--  	linefoldingonly = true,
--  }

local lspconfig = require("lspconfig")

-- Folding based on lsp - provided to UFO
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local servers = {
	"html",
	"cssls",
	"dockerls",
	"jsonls",
	"java_language_server",
	"kotlin_language_server",
	"pyright",
	"tsserver",
	"vimls",
	"typescript_language_server",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Show diagnostic messages on hover https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
vim.o.updatetime = 100
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
