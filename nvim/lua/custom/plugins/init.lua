return {
	---------------- Plugin Overrides ------------------

	["kyazdani42/nvim-tree.lua"] = {
		override_options = require("custom.plugins.nvim-tree").overrides,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = require("custom.plugins.treesitter").overrides,
	},

	["williamboman/mason.nvim"] = {
		override_options = require("custom.plugins.mason").overrides,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	---------------- Custom plugins ------------------

	["alexghergh/nvim-tmux-navigation"] = {
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-Left>",
					down = "<C-Down>",
					up = "<C-Up>",
					right = "<C-Right>",
				},
			})
		end,
	},
	-- formatter
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls").setup()
		end,
	},
	-- Provides nice folding
	["kevinhwang91/nvim-ufo"] = {
		requires = "kevinhwang91/promise-async",
		config = function()
			require("custom.plugins.ufo")
		end,
	},
}
