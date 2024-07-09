-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap(
  "n",
  "<leader>cd",
  ":cd %:p:h<CR>:let @+=shellescape(expand('%:p:h'), 1)<CR>",
  { noremap = true, silent = true }
)
