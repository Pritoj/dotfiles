local M = {}

M.overrides = {
  -- Enable git intefration 
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
    -- Highlight git changes in the sidebar
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
