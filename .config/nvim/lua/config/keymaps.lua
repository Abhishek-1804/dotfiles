-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Change terminal to current directory and copy path to clipboard
vim.api.nvim_set_keymap(
	"n",
	"<leader>cd",
	":cd %:p:h<CR>:let @+=shellescape(expand('%:p:h'), 1)<CR>",
	{ noremap = true, silent = true }
)

-- Map <leader>ft to open a terminal in a horizontal split at the bottom
vim.api.nvim_set_keymap("n", "<leader>ft", ":20split | terminal<CR>", { noremap = true, silent = true })
-- Adjust the size if needed
