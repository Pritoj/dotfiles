local M = {}

M.treesitter = {
	ensure_installed = {
		-- Shell stuff
		"bash",

		-- Lua stuff
		"lua",

		-- WebDev
		"html",
		"css",
		"javascript",
		"typescript",
		"scss",
		"tsx",

		-- Config Formats
		"yaml",
		"toml",
		"json5",

		"ruby",

		"go",
		"dockerfile",
		"c",

		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",
		"luacheck",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"json-lsp",
		"typescript-language-server",
		"prettierd",

		-- Smithy
		"smithy-language-server",

		--Rust
		"rust-analyzer",

		--Kotlin
		"kotlin-language-server",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
	filters = {
		-- Don't hide them dot files
		dotfiles = false,
		-- Don't show node_modules
		custom = { "node_modules" },
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
