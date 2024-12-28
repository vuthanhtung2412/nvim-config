-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("t", ";;", "<C-\\><C-n>", { silent = true })
-- Prevent change and delete motion from sending to the clipboard in normal mode
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "r", '"_r', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "s", '<nop>', { noremap = true, silent = true })
-- flash keymaps
vim.keymap.set({ "n", "x", "o" }, "f", function()
  require("flash").jump()
end, { desc = "Flash" })
-- I don't use this and it mess up surround.nvim
-- vim.keymap.set({ "n", "x", "o" }, "F", function()
--   require("flash").treesitter()
-- end, { desc = "Flash Treesitter" })
