local M = {}

M.vainilla = {

	n = {
		["<C-S-Up>"] = { "<cmd> resize +2 <CR>", "Resize window up" },
		["<C-S-Down>"] = { "<cmd> resize -2 <CR>", "Resize window down" },
		["<C-S-Left>"] = { "<cmd> vertical resize -2 <CR>", "Resize window left" },
		["<C-S-Right>"] = { "<cmd> vertical resize +2 <CR>", "Resize window right" },
	},
}
return M
