-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
-- vim.keymap.set("i", "jj", "<Esc>:w<CR>", { silent = true })
vim.keymap.set("t", ";;", "<C-\\><C-n>", { silent = true })
-- Prevent change and delete motion from sending to the clipboard in normal mode
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "r", '"_r', { noremap = true, silent = true })
vim.keymap.set({ "n" }, "yY", "_y$", { noremap = true, silent = true })
-- inspration : https://stackoverflow.com/a/77247473/14281306
vim.api.nvim_set_keymap("x", "il", "g_o^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "il", ":<C-u>normal vil<CR>", { noremap = true, silent = true })
-- inspration : https://stackoverflow.com/a/16136133
vim.keymap.set({ "n" }, "oo", "o<ESC>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "OO", "O<ESC>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "F", "<nop>", { noremap = true, silent = true })
-- Yank file name
vim.keymap.set(
  "n",
  "<leader>fp",
  ':let @+ = expand("%")<CR>',
  { desc = "yank file relative file", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<leader>fP",
  ':let @+ = expand("%:p")<CR>',
  { desc = "yank absolute file path", noremap = true, silent = true }
)

-- Keymap only for Terraform files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform", -- Only apply to terraform files
  callback = function()
    vim.keymap.set(
      "n",
      "gx",
      ":OpenDoc<CR>",
      { noremap = true, silent = true, buffer = true, desc = "Open Terraform Doc" }
    )
  end,
})

-- https://www.reddit.com/r/neovim/comments/ro6oye/open_link_from_neovim/
vim.keymap.set(
  "n",
  "gx",
  [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
  { noremap = true, silent = true }
)

-- search by directory then grep
-- https://www.reddit.com/r/neovim/comments/1ifcksk/comment/majansf/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.keymap.set("n", "<leader>fdg", function()
  -- Get a list of all directories in the workspace
  local workspace_path = vim.fn.getcwd()
  local directories = vim.fn.systemlist("find " .. workspace_path .. " -type d")

  -- Present the directories to the user for selection
  vim.ui.select(directories, {
    prompt = "Select a directory:",
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice then
      require("snacks").picker.grep({ dirs = { choice } })
    else
      print("No directory selected")
    end
  end)
end, { desc = "Grep directory" })
-- Tung is here
