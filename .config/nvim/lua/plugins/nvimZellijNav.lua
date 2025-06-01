return {
	"swaits/zellij-nav.nvim",
	lazy = true,
	event = "VeryLazy",
	keys = {
		{ "<C-h>", "<cmd>ZellijNavigateLeft<CR>", { silent = true, desc = "Navigate Left" } },
		{ "<C-j>", "<cmd>ZellijNavigateDown<CR>", { silent = true, desc = "Navigate Down" } },
		{ "<C-k>", "<cmd>ZellijNavigateUp<CR>", { silent = true, desc = "Navigate Up" } },
		{ "<C-l>", "<cmd>ZellijNavigateRight<CR>", { silent = true, desc = "Navigate Right" } },
	},
	opts = {},
}
