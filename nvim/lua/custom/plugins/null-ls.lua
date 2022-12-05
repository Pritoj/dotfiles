local null_ls = require("null-ls")
local b = null_ls.builtins

local sources = {

	-- Typescript, Javascript, HTML, CSS
	b.formatting.prettierd.with({
		filetypes = { "html", "markdown", "css", "typescript", "javascript", "typescriptreact", "json" },
	}),
	b.diagnostics.eslint_d,
	b.code_actions.eslint_d,

	-- Python
	b.formatting.black,
	b.diagnostics.mypy,
	b.diagnostics.flake8,

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format on save
		on_attach = function(client)
			if client.server_capabilities.document_formatting then
				vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
			end
		end,
	})
end

return M
