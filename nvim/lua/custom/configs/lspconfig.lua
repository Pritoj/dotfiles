local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local schemaStore = require("schemastore")

-- Folding based on lsp - provided to UFO
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"dockerls",
	"jsonls",
	"vimls",
	"pyright",
	-- Will be setup by rust-tools
	-- "rust_analyzer",
}

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = schemaStore.json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = schemaStore.yaml.schemas(),
		},
	},
})

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
-- https://neovim.discourse.group/t/how-to-show-diagnostics-on-hover/3830/2
function OpenDiagnosticIfNoFloat()
	for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_get_config(winid).zindex then
			return
		end
	end
	-- Show diagnostic messages on hover https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
	-- THIS IS FOR BUILTIN LSP
	vim.diagnostic.open_float(0, {
		scope = "cursor",
		focusable = false,
		close_events = {
			"CursorMoved",
			"CursorMovedI",
			"BufHidden",
			"InsertCharPre",
			"WinLeave",
		},
	})
end
-- Show diagnostics under the cursor when holding position
vim.o.updatetime = 100
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	pattern = "*",
	command = "lua OpenDiagnosticIfNoFloat()",
	group = "lsp_diagnostics_hold",
})

--
-- lspconfig.pyright.setup { blabla}
